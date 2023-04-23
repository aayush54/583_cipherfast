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
Function *main_func;
GlobalVariable *seed;

Function *createXorshift32(Module *module)
{
    LLVMContext &context = module->getContext();
    Type *int32Ty = Type::getInt32Ty(context);
    Type *int64Ty = Type::getInt64Ty(context);
    Type *int32PtrTy = Type::getInt32PtrTy(context);
    Type *int64PtrTy = Type::getInt64PtrTy(context);

    // Define the function type
    FunctionType *funcType = FunctionType::get(int32Ty, {int32PtrTy}, false);

    // Create the function
    Function *func = Function::Create(
        funcType, Function::LinkageTypes::ExternalLinkage,
        "xorshift32", module);

    // Create the entry basic block
    BasicBlock *entryBB = BasicBlock::Create(context, "entry", func);

    // Create an IR builder
    IRBuilder<> builder(entryBB);

    // Allocate memory for the state pointer and the x variable
    AllocaInst *stateAddr = builder.CreateAlloca(int32PtrTy);
    AllocaInst *x = builder.CreateAlloca(int32Ty);

    // Store the state argument into the state pointer
    Argument &stateArg = *(func->arg_begin());
    builder.CreateStore(&stateArg, stateAddr);

    // Load the state pointer and get the first element of the state array
    LoadInst *stateLoad = builder.CreateLoad(int32PtrTy, stateAddr);
    Constant *zero = ConstantInt::get(int64Ty, 0);
    Value *arrayIdx = builder.CreateGEP(int32Ty, stateLoad, zero);

    // Load the first element of the state array into x
    LoadInst *xLoad = builder.CreateLoad(int32Ty, arrayIdx);
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
    LoadInst *xFinalLoad = builder.CreateLoad(int32Ty, x);
    builder.CreateStore(xFinalLoad, arrayIdx);

    // Return the final value of x
    builder.CreateRet(xFinalLoad);
    return func;
}

namespace
{
    struct Hello : public FunctionPass
    {
        static char ID;
        Hello() : FunctionPass(ID) {}

        bool doInitialization(Module &M) override
        {
            main_func = createXorshift32(&M);
            errs() << "Created func\n";

            // Get the LLVM context
            LLVMContext context;

            auto intType = IntegerType::get(context, 32);

            // Create an array type with one element of type i32
            errs() << "hi\n";

            std::vector<Constant *> values;
            values.push_back(ConstantInt::get(intType, 47));
            auto arrType = ArrayType::get(intType, values.size());

            errs() << "hi\n";
            auto init = llvm::ConstantArray::get(arrType, values);

            // auto globalDeclaration = new GlobalVariable(
            //     arrType,
            //     false,
            //     GlobalValue::LinkageTypes::CommonLinkage,
            //     init,
            //     "seed");
            auto globalDeclaration = (llvm::GlobalVariable *)M.getOrInsertGlobal("seed", arrType);
            globalDeclaration->setInitializer(init);
            globalDeclaration->setConstant(false);
            globalDeclaration->setLinkage(llvm::GlobalValue::LinkageTypes::CommonLinkage);
            globalDeclaration->setUnnamedAddr(llvm::GlobalValue::UnnamedAddr::Global);

            errs() << "Created global\n";

            // Add the global variable to the module

            return true;
        }

        bool runOnFunction(Function &F) override
        {

            // Instruction &x = F.front().front();
            // IRBuilder<> builder(&x);

            // builder.CreateCall(main_func, seed);
            errs() << "RUNFUNC\n";

            return true;
        }
    };
}

char Hello::ID = 0;
static RegisterPass<Hello> X("rand", "Rand Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);
