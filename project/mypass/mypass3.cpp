#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include <unordered_map>

using namespace llvm;

namespace {
  struct PrintMemoryWrites : public FunctionPass {
    static char ID;
    PrintMemoryWrites() : FunctionPass(ID) {}

    // create the hash table in the global space
    std::unordered_map< Value* /*memory address*/, Value* /*mask address*/> m;

    bool runOnFunction(Function &F) override {
      for (auto &BB : F) {
        for (auto &I : BB) {
          if (auto *store = dyn_cast<StoreInst>(&I)) { //AllocaInst? someone could look into this
            store->print(llvm::outs());
            llvm::outs() << "\n";
            errs() << I << "\n";

            // get the store pointer (memory address)
            Value* stPtrOperand = store->getPointerOperand();
            errs() << "get store pointer operand *: " << *stPtrOperand << "\n";
            errs() << "get store pointer operand: " << stPtrOperand << "\n";

            // hash the memory address with mask address
            m[stPtrOperand] = store->getValueOperand(); //replace with hash memory
            errs() << "hash table: " << m[stPtrOperand] << '\n';


            // Get the type of the value being stored
            // 0x55e7d2448260 32
            // 0x55e7d2448230 8
            // 0x55e7d2448278 64
            Type *storedValueType = store->getValueOperand()->getType();
            errs() << "getValueOperand"<<*store->getValueOperand() << '\n';
            // Check if the stored value type is an i64 type
            if (auto *intType = dyn_cast<IntegerType>(storedValueType)) {
              if (intType->getBitWidth() == 64) {
                // The stored value type is an i64 type
                errs() <<"stored value type"<< *storedValueType << "\n";
              }
            }
            //if(storedValueType->getIntegerBitWidth == 64)errs() << storedValueType << "\n";

          }

          if (auto *load = dyn_cast<LoadInst>(&I)) { //AllocaInst? someone could look into this
            load->print(llvm::outs());
            llvm::outs() << "\n";
            errs() << I << "\n";

            // get load memory address (pointer)
            Value* ldPtrOperand = load->getPointerOperand();
            errs() << "get load pointer operand *: " << *ldPtrOperand << "\n";
            errs() << "get load pointer operand: " << ldPtrOperand << "\n";

            // search load memory address from hash table
            
            // get mask value from pointer

            // decode data 
            // (value stored in the load mem address) XOR (mask) =
             


          }
        }
      }
      return false;
    }
  };
}

char PrintMemoryWrites::ID = 0;

static RegisterPass<PrintMemoryWrites> X("print-memory-writes", "Print all memory writes in function", false, false);