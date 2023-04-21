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

using namespace llvm;

namespace {
  struct PrintMemoryWrites : public FunctionPass {
    static char ID;
    PrintMemoryWrites() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      std::srand(std::time(nullptr)); // initialize random seed
      LLVMContext &Context = F.getContext();
      for (auto &BB : F) {
        for (auto &I : BB) {
          if (auto *store = dyn_cast<StoreInst>(&I)) { 
            store->print(llvm::outs());
            llvm::outs() << "\n";
            errs() << I << "\n";
            // allocate space for mask
            Value *storedValueType = store->getValueOperand();
            int store_size = dyn_cast<IntegerType>(storedValueType->getType())->getBitWidth();
            AllocaInst* maskAlloca = new AllocaInst(storedValueType->getType(), 0, Twine(), store);
            errs() << *maskAlloca << "\n";
            
            // generate mask of store_size bits
            int random_number = std::rand() % int(pow(2, store_size));
            Value* random_number_value = ConstantInt::get(IntegerType::get(Context, store_size), random_number);
            errs() << random_number << "\n";
            // store mask in allocated space
            StoreInst* maskStore = new StoreInst(random_number_value, maskAlloca, store);
            errs() << *maskStore << "\n";

            // apply mask to write
            errs() << "----" << *random_number_value->getType() << ' ' << *storedValueType->getType() << "----\n";
            Instruction* maskInst = BinaryOperator::CreateXor(random_number_value, storedValueType, "xor");
            maskInst->insertBefore(store);
            errs() << *maskInst << '\n';

            // store masked value
            store->setOperand(0, maskInst);
            errs() << *store << '\n';

            errs() << "\n" << "\n";
          }
        }
      }
      return false;
    }
  };
}

char PrintMemoryWrites::ID = 0;

static RegisterPass<PrintMemoryWrites> X("print-memory-writes", "Print all memory writes in function", false, false);