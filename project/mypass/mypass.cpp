#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
    struct Hello : public FunctionPass {
        static char ID;
        Hello() : FunctionPass(ID) {}

        bool runOnFunction(Function &F) override {
            errs() << "Hello: ";
            errs().write_escaped(F.getName()) << '\n';
            // check all load and store to get memory accesses
            // allocate mask for each memory access
            return false;
        }
    };

//     struct Hello : public FunctionPass {
// //    struct PrintInstructions : public FunctionPass {
//     static char ID;
// //    PrintInstructions() : FunctionPass(ID) {}
//     Hello() : FunctionPass(ID) {}
//         bool runOnFunction(Function &F) override {
//         for (auto &BB : F) {
//             for (auto &I : BB) {
//             I.print(llvm::outs());
//             errs() << I << '\n';
//             }
//         }
//         return false;
//         }
//     };
}

char Hello::ID = 0;
static RegisterPass<Hello> X("hello", "Hello World Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

// pass name -->vHello --> hello or Hello World Pass
