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

namespace {
  struct PrintMemoryWrites : public FunctionPass {
    static char ID;
    PrintMemoryWrites() : FunctionPass(ID) {}

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


    // create the hash table in the global space
    std::unordered_map< Value* /*memory address*/, Value* /*mask address*/> m;
    unsigned int start_address = 0;

    bool runOnFunction(Function &F) override {

            //! Make sure not to instrument the xorshift mask generators
            if (F.getName().substr(0, 10) == "__xorshift")
                return false;

            errs() << F.getName() << "\n" << "\n";

            Instruction &x = F.front().front();
            IRBuilder<> builder(&x);
            builder.CreateCall(maskGen[32], seed);
            std::cout<< "IR Builder" << x << "\n";


      std::srand(std::time(nullptr)); // initialize random seed
      LLVMContext &Context = F.getContext();
      for (auto &BB : F) {
        for (auto &I : BB) {
          if (auto *store = dyn_cast<StoreInst>(&I)) { 
            // print st instruction
            errs() << I << "\n";

            // allocate space for mask
            Value *storedValue = store->getValueOperand();
            unsigned int store_size = dyn_cast<IntegerType>(storedValue->getType())->getBitWidth();
            AllocaInst* maskAlloca = new AllocaInst(storedValue->getType(), start_address, Twine(), store);
            //errs() << *maskAlloca << "\n";
            start_address += store_size;
            
            // generate mask of store_size bits
            int random_number = std::rand() % int(pow(2, store_size));
            errs() << "randomly generated mask: " << random_number << "\n";
            Value* random_number_value = ConstantInt::get(IntegerType::get(Context, store_size), random_number);
             errs() << random_number_value << "\n";

            // store mask in allocated space
            StoreInst* maskStore = new StoreInst(random_number_value, maskAlloca, store);
            // errs() << *maskStore << "\n";

            // apply mask to write
            // errs() << "----" << *random_number_value->getType() << ' ' << *storedValueType->getType() << "----\n";
            Instruction* maskInst = BinaryOperator::CreateXor(random_number_value, storedValue, "xor");
            maskInst->insertBefore(store);
            // errs() << *maskInst << '\n';

            // store masked value to the store address
            // --> do getOperand(0) after to make sure we are storing the right mask value
            store->setOperand(0, maskInst);
            errs() << "new store: " << *store << '\n';

            // get the store pointer (memory address)
            Value* stPtrOperand = store->getPointerOperand();
            // errs() << "get store pointer operand *: " << *stPtrOperand << "\n";
            // errs() << "get store pointer operand: " << stPtrOperand << "\n";

            // get the memory pointer for alloca inst
            //Value* maskAddress2 = maskAlloca->getPointerOperand();
            //Value* maskAddress = maskAlloca->getOperand(0); //this gives you the type of the new store
            //errs() << "mask address1?: " << maskAddress << "\n"; 
            unsigned int maskAddress = maskAlloca->getAddressSpace();
            errs() << "mask address2?: " << maskAddress << "\n";


            // hash the memory address with mask value
            m[stPtrOperand] = random_number_value; //replace with hash memory
            errs() << "hash table key address: " << stPtrOperand << '\n';
            errs() << "hash table: " << m[stPtrOperand] << '\n';

            // end of st inst
            errs() << "\n" << "\n";

          }

          // if (auto *load = dyn_cast<LoadInst>(&I)) { //AllocaInst? someone could look into this
          //   load->print(llvm::outs());
          //   llvm::outs() << "\n";
          //   errs() << I << "\n";

          //   // get load memory address (pointer)
          //   Value* ldPtrOperand = load->getPointerOperand();
          //   // Value* ldPtrOperand = load->getValueOperand();
          //   errs() << "get load pointer operand *: " << *ldPtrOperand << "\n";
          //   errs() << "get load pointer operand: " << ldPtrOperand << "\n";

          //   // search load memory address from hash table
          //   if(!m[ldPtrOperand]){
          //     errs() << "not found in hash" << '\n';

          //   }
          //   else {
          //     errs() << "found hash value! \n";
              
          //     // //Type* valType = ldPtrOperand->getType()->getPointerElementType(); // Type of value being pointed to

          //     // //we can't do XOR with Value* of different type
          //     // errs() << *m[ldPtrOperand]->getType() << "\n"; //i32?
          //     // errs() << *ldPtrOperand << "\n"; // ptr
              


          //     // Instruction* ldMaskInst = BinaryOperator::CreateXor(m[ldPtrOperand], ldPtrOperand, "xor");
          //     // errs() << ldMaskInst << "\n";
          //     // maskInst->insertAfter(load);

          //     // // how to return the value when XOR just compututes?
          //     // // %insert_result = insertvalue %my_struct %s, i32 %value, 1
          //     // // just
          //     // // newPtr = ???;
          //     // load->setOperand(0, newPtr);


              
          //   }
            
          //   // get mask value from pointer

          //   // decode data 
          //   // (value stored in the load mem address) XOR (mask) =
             
          // }
        
      
        }
      }
      return true;
    }
  };
}

char PrintMemoryWrites::ID = 0;

static RegisterPass<PrintMemoryWrites> X("print-memory-writes", "Print all memory writes in function", false, false);