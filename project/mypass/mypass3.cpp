#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Value.h"
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <cmath>
#include <unordered_map>
#include <stddef.h>

using namespace llvm;

namespace {
  struct PrintMemoryWrites : public FunctionPass {
    static char ID;
    PrintMemoryWrites() : FunctionPass(ID) {}

    // create the hash table in the global space
    std::unordered_map< Value* /*memory address*/, Value* /*mask address*/> m;
    unsigned int start_address = 0;

    bool runOnFunction(Function &F) override {
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
      return false;
    }
  };
}

char PrintMemoryWrites::ID = 0;

static RegisterPass<PrintMemoryWrites> X("print-memory-writes", "Print all memory writes in function", false, false);