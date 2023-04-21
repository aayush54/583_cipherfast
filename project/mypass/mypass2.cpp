#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
  struct PrintInstructions : public FunctionPass {
    static char ID;
    PrintInstructions() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      for (auto &BB : F) {
        for (auto &I : BB) {
          I.print(llvm::outs());
          errs() << I << '\n';
        }
      }
      return false;
    }
  };
}

char PrintInstructions::ID = 0;

static RegisterPass<PrintInstructions> X("print-instructions", "Print all instructions in function", false, false);
