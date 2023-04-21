#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
  struct PrintMemoryWrites : public FunctionPass {
    static char ID;
    PrintMemoryWrites() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      for (auto &BB : F) {
        for (auto &I : BB) {
          if (auto *store = dyn_cast<StoreInst>(&I)) { //AllocaInst? someone could look into this
            store->print(llvm::outs());
            llvm::outs() << "\n";
            errs() << I << "\n";
          }
        }
      }
      return false;
    }
  };
}

char PrintMemoryWrites::ID = 0;

static RegisterPass<PrintMemoryWrites> X("print-memory-writes", "Print all memory writes in function", false, false);