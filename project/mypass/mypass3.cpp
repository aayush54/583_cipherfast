#include "llvm/Pass.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"

#include "llvm/ADT/Statistic.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <cstdlib>
#include <ctime>
#include <cmath>
#include <unordered_map>
#include <stddef.h>
#include <vector>


using namespace llvm;

std::vector<LoadInst*> maskedLoads;
std::vector<StoreInst*> maskedStores;
std::unordered_map<int, Function *> maskGen;
GlobalVariable *seed;

// Create mask function for given size (8, 32, 64, etc.)
Function *createXorshift(Module *module, int bitsize)
{
    LLVMContext &context = module->getContext();
    // Type *int32Ty = Type::getInt32Ty(context);
    Type *int64Ty = Type::getInt64Ty(context);
    // Type *int32PtrTy = Type::getInt32PtrTy(context);
    // Type *int64PtrTy = Type::getInt64PtrTy(context);

    Type *intTy = Type::getIntNTy(context, bitsize);
    Type *intPtrTy = Type::getIntNPtrTy(context, bitsize);

    // Define the function type
    FunctionType *funcType = FunctionType::get(intTy, intPtrTy, false);

    // Create the function
    std::string name = "__xorshift" + std::to_string(bitsize);
    Function *func = Function::Create(
        funcType, Function::LinkageTypes::PrivateLinkage,
        name, module);

    // Create the entry basic block
    BasicBlock *entryBB = BasicBlock::Create(context, "entry", func);

    // Create an IR builder
    IRBuilder<> builder(entryBB);

    // Allocate memory for the state pointer and the x variable
    AllocaInst *stateAddr = builder.CreateAlloca(intPtrTy);
    AllocaInst *x = builder.CreateAlloca(intTy);

    // Store the state argument into the state pointer
    Argument &stateArg = *(func->arg_begin());
    builder.CreateStore(&stateArg, stateAddr);

    // Load the state pointer and get the first element of the state array
    LoadInst *stateLoad = builder.CreateLoad(intPtrTy, stateAddr);
    Constant *zero = ConstantInt::get(int64Ty, 0);
    Value *arrayIdx = builder.CreateGEP(intTy, stateLoad, zero);

    // Load the first element of the state array into x
    LoadInst *xLoad = builder.CreateLoad(intTy, arrayIdx);
    builder.CreateStore(xLoad, x);

    // Apply the xorshift32 algorithm to x
    Value *shl = builder.CreateShl(xLoad, 13);
    Value *xor1 = builder.CreateXor(xLoad, shl);
    builder.CreateStore(xor1, x);

    Value *shr = builder.CreateLShr(xor1, 17);
    Value *xor2 = builder.CreateXor(xor1, shr);
    builder.CreateStore(xor2, x);

    Value *shl2 = builder.CreateShl(xor2, 5);
    Value *xor3 = builder.CreateXor(xor2, shl2);
    builder.CreateStore(xor3, x);

    // Store the updated x back into the state array
    LoadInst *xFinalLoad = builder.CreateLoad(intTy, x);
    builder.CreateStore(xFinalLoad, arrayIdx);

    // Return the final value of x
    builder.CreateRet(xFinalLoad);
    return func;
}

namespace {
  struct PrintMemoryWrites : public FunctionPass {
    static char ID;
    PrintMemoryWrites() : FunctionPass(ID) {}

    Function *funcInitMap;
    Function *funcRecordMask;
    Function *funcFindMask;
    // Function *funcKillMap;

      bool doInitialization(Module &M) override
        {
            maskGen[8] = createXorshift(&M, 8);
            maskGen[16] = createXorshift(&M, 16);
            maskGen[32] = createXorshift(&M, 32);
            maskGen[64] = createXorshift(&M, 64);

            // Get the LLVM context
            LLVMContext &context = M.getContext();
            auto intType = IntegerType::get(context, 64);

            // Create an array type with one element of type i32

            std::vector<Constant *> values;
            values.push_back(ConstantInt::get(intType, 47));
            auto arrType = ArrayType::get(intType, values.size());

            auto init = ConstantArray::get(arrType, values);

            seed = (llvm::GlobalVariable *)M.getOrInsertGlobal("seed", arrType);
            seed->setInitializer(init);
            seed->setConstant(false);
            seed->setLinkage(llvm::GlobalValue::LinkageTypes::PrivateLinkage);
            seed->setUnnamedAddr(llvm::GlobalValue::UnnamedAddr::Global);

            // Declare extern function
            Type *argType1, *argType2, *rsltType;
            FunctionType *extFuncType;
            rsltType = Type::getVoidTy(M.getContext());
            extFuncType = FunctionType::get(rsltType, {}, false);
            funcInitMap = Function::Create(extFuncType, Function::ExternalLinkage, "initMap", M);

            argType1 = Type::getInt8PtrTy(M.getContext());
            argType2 = Type::getInt64Ty(M.getContext());
            rsltType = Type::getVoidTy(M.getContext());
            extFuncType = FunctionType::get(rsltType, { argType1, argType2 }, false);
            funcRecordMask = Function::Create(extFuncType, Function::ExternalLinkage, "recordMask", M);

	    argType1 = Type::getInt8PtrTy(M.getContext());
            rsltType = Type::getInt64Ty(M.getContext());
            extFuncType = FunctionType::get(rsltType, { argType1 }, false);
            funcFindMask = Function::Create(extFuncType, Function::ExternalLinkage, "findMask", M);
            // Add the global variable to the module
            return true;
        }


    // create the hash table in the global space
    // std::unordered_map< Value*, AllocaInst* > m; // memory address, mask address

    bool runOnFunction(Function &F) override {
      // DON'T instrument the xorshift mask-gen
      // errs() << F.getName() << "\n";
      if (F.getName().substr(0, 10) == "__xorshift") return false;
      Instruction *funcHead = &(F.front().front());
      if (F.getName() == "main") {
        std::vector< Value * > emptyArgs;
        CallInst *callInitMap = CallInst::Create(funcInitMap, emptyArgs, "", funcHead);
        errs() << "InitMap inserted\n";
      }
      // IRBuilder<> builder(funcHead);
      // builder.CreateCall(maskGen[32], seed);
      // std::srand(std::time(nullptr)); // initialize random seed

      LLVMContext &Context = F.getContext();
      for (auto &BB : F) {
        // errs() << BB.getName() << "\n";
        for (auto &I : BB) {
	  errs() << I << "\n";
          if (auto *store = dyn_cast<StoreInst>(&I)) {
            // excluded cases: masked/mask stores, non-integer stored value, ...
	    // otherwise, nullptr dereference!
            for (auto visited : maskedStores) if (visited == store) continue;
            Value* storedValue = store->getValueOperand();
            Value* stPtrOperand = store->getPointerOperand();
            IntegerType* storedType = dyn_cast<IntegerType>(storedValue->getType());
            if (storedType == nullptr) continue;

            // generate mask of store_size bits
	    unsigned int store_size = storedType->getBitWidth();
            IRBuilder<> builder(store);
            Instruction* rand_num = builder.CreateCall(maskGen[store_size], seed);
            // apply mask to write
            Instruction* maskInst = BinaryOperator::CreateXor(rand_num, storedValue, "xor");
            maskInst->insertBefore(store);
            // store masked value to the store address
            store->setOperand(0, maskInst);

            // store mask in hash table
            LLVMContext &ptrContext = stPtrOperand->getContext();
            PointerType *stPtrVoidTy = Type::getInt8PtrTy(ptrContext);
            CastInst *ptrCast = CastInst::CreatePointerCast(stPtrOperand, stPtrVoidTy, "strptrcast");
            ptrCast->insertAfter(store);

            LLVMContext &intContext = rand_num->getContext();
            Value* int64Instance = ConstantInt::get(intContext, APInt(64, 0));
            CastInst* intCast = CastInst::CreateIntegerCast(rand_num, int64Instance->getType(), false, "strintcast");
            intCast->insertAfter(ptrCast);

            std::vector< Value * > pairArgs = { ptrCast, intCast };
            CallInst *callRecordMask = CallInst::Create(funcRecordMask, pairArgs, "", (Instruction *)nullptr);
            callRecordMask->insertAfter(intCast);

            maskedStores.push_back(store);
            errs() << "RAND " <<  *rand_num << " STR " << *store << " MASK " << *callRecordMask << "\n";
          }

          if (auto *load = dyn_cast<LoadInst>(&I)) { //AllocaInst? someone could look into this
            // excluded cases: masked/mask loads, not yet masked, ...
            for (auto visited : maskedLoads) if (visited == load) continue;
            IntegerType* loadType = dyn_cast<IntegerType>(load->getType());
            if (loadType == nullptr) continue;
            // search load memory address from hash table
            Value* ldPtrOperand = load->getPointerOperand();
            LLVMContext &ptrContext = ldPtrOperand->getContext();
            PointerType *ldPtrVoidTy = Type::getInt8PtrTy(ptrContext);
            CastInst *ptrCast = CastInst::CreatePointerCast(ldPtrOperand, ldPtrVoidTy, "ldptrcast");
            ptrCast->insertAfter(load);
            CallInst *callFindMask = CallInst::Create(funcFindMask, ptrCast, "", (Instruction *)nullptr);
            callFindMask->insertAfter(ptrCast);

            LLVMContext &intContext = callFindMask->getContext();
            unsigned int intSize = load->getType()->getScalarSizeInBits();
            Value* intXInstance = ConstantInt::get(intContext, APInt(intSize, 0));
            CastInst *intCast = CastInst::CreateIntegerCast(callFindMask, intXInstance->getType(), false, "ldintcast");
            intCast->insertAfter(callFindMask);
            Instruction *ldMaskInst = BinaryOperator::CreateXor(intCast, load, "xor");
	    ldMaskInst->insertAfter(intCast); // otherwise, floating instruction!

            // replace all uses of old loaded value
	    for (auto U : load->users()) {
              Instruction* userI = dyn_cast<Instruction>(U);
	      if ((userI) && (userI != ldMaskInst)) {
		for (int i = 0; i < userI->getNumOperands(); ++i)
		  if (load == userI->getOperand(i)) userI->setOperand(i, ldMaskInst);
              }
            }
            maskedLoads.push_back(load);
          }
	}
      }
      return true;
    }
  };
}

char PrintMemoryWrites::ID = 0;

static RegisterPass<PrintMemoryWrites> X("print-memory-writes", "Print all memory writes in function", false, false);
