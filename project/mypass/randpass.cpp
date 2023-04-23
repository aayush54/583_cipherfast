#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"

#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Module.h"
#include <unordered_map>

using namespace llvm;
Function *main_func;
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

namespace
{
    struct Hello : public FunctionPass
    {
        static char ID;
        Hello() : FunctionPass(ID) {}

        bool doInitialization(Module &M) override
        {
            maskGen[8] = createXorshift(&M, 8);
            maskGen[16] = createXorshift(&M, 16);
            maskGen[32] = createXorshift(&M, 32);
            maskGen[64] = createXorshift(&M, 64);
            errs() << "Created func\n";

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

            errs() << "Created global\n";

            // Add the global variable to the module
            return true;
        }

        bool runOnFunction(Function &F) override
        {

            //! Make sure not to instrument the xorshift mask generators
            if (F.getName().substr(0, 10) == "__xorshift")
                return false;

            errs() << F.getName() << "\n";

            Instruction &x = F.front().front();
            IRBuilder<> builder(&x);
            builder.CreateCall(maskGen[32], seed);

            return true;
        }
    };
}

char Hello::ID = 0;
static RegisterPass<Hello> X("rand", "Rand Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);
