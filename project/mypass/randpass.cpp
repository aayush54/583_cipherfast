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

using namespace llvm;

namespace
{
    struct Hello : public FunctionPass
    {
        static char ID;
        Hello() : FunctionPass(ID) {}

        bool runOnFunction(Function &F) override
        {

            for (BasicBlock::iterator BI = BB->begin(), BE = BB->end(); BI != BE; ++BI)
            {
                if (isa<BranchInst>(&(*BI)))
                {
                    errs() << "found a brach instruction!\n";
                    ArrayRef<Value *> arguments(ConstantInt::get(Type::getInt32Ty(M.getContext()), counter, true));
                    Instruction *newInst = CallInst::Create(main_func, arguments, "");
                    BB->getInstList().insert(BI, newInst);
                    errs() << "Inserted the function!\n";
                }
            }
        }
    }
}

bool doInitialization(Module &M)
{
    LLVMContext context;
    IRBuilder<> builder(context);

    auto module = std::make_unique<Module>("hello", context);

    // build a 'main' function
    auto i32 = builder.getInt32Ty();
    auto prototype = FunctionType::get(i32, false);
    main_fn = Function::Create(prototype, Function::ExternalLinkage, "main", module.get());
    BasicBlock *body = BasicBlock::Create(context, "body", main_fn);
    builder.SetInsertPoint(body);

    // use libc's printf function
    auto i8p = builder.getInt8PtrTy();
    auto printf_prototype = FunctionType::get(i8p, true);
    auto printf_fn = Function::Create(printf_prototype, Function::ExternalLinkage, "printf", module.get());

    // call printf with our string
    auto format_str = builder.CreateGlobalStringPtr("hello world\n");
    builder.CreateCall(printf_fn, {format_str});

    // return 0 from main
    auto ret = ConstantInt::get(i32, 0);
    builder.CreateRet(ret);

    return false;
}
}
;
}

char Hello::ID = 0;
static RegisterPass<Hello> X("rand", "Rand Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);
