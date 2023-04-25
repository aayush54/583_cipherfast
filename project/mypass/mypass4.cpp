#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Pass.h"

using namespace llvm;

namespace {
  struct MyPass : public FunctionPass {
    static char ID;
    MyPass() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      for (auto& BB : F) {
        for (auto& I : BB) {
          if (auto* store = dyn_cast<StoreInst>(&I)) {
            errs() << "original store:"<< I << "\n";
            errs() << "getOperand(0): " << *store->getOperand(0) << "\n";
            errs() << "getOperand(1): " << *store->getOperand(1) << "\n";
            //errs() << "getOperand(2): " << store->getOperand(2) << "\n";

            IRBuilder<> builder(store);
            Type* type = store->getValueOperand()->getType();
            AllocaInst* allocaInst = builder.CreateAlloca(type);
            errs() << "alloca inst: " << *allocaInst << "\n";
            errs() << "alloca inst get value: " << allocaInst->getValueName() << "\n";
            errs() << "alloca inst get Operand(0): " << allocaInst->getAddressSpace() << "\n";

            store->setOperand(1, allocaInst);


          }
        }
      }

      return true;
    }
  };
}

char MyPass::ID = 0;

static RegisterPass<MyPass> X("MyPass", "My Pass");