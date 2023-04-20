#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Scalar/LoopPassManager.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Support/BranchProbability.h"

using namespace llvm;


namespace Correctness{
  struct FPLICMPass : public LoopPass {
    static char ID;
    FPLICMPass() : LoopPass(ID) {}

    bool runOnLoop(Loop *L, LPPassManager &LPM) override {
        


    }

    void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.addRequired<BranchProbabilityInfoWrapperPass>();
    AU.addRequired<BlockFrequencyInfoWrapperPass>();
    AU.addRequired<LoopInfoWrapperPass>();
    // You can add more Analysis Passes, if needed.
    }

    private:
        /// Little predicate that returns true if the specified basic block is in
        /// a subloop of the current one, not the current one itself.
        bool inSubLoop(BasicBlock *BB, Loop *CurLoop, LoopInfo *LI) {
            assert(CurLoop->contains(BB) && "Only valid if BB is IN the loop");
            return LI->getLoopFor(BB) != CurLoop;
        }

  };
} //end of namespace

char Correctness::FPLICMPass::ID = 0;
static RegisterPass<Correctness::FPLICMPass> X("fplicm-correctness", "Frequent Loop Invariant Code Motion for correctness test", false, false);
