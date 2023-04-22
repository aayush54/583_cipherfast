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
#include <fstream>
#include <string>

using namespace llvm;

namespace {
  struct PrintMemoryWrites : public FunctionPass {
    static char ID;
    std::unordered_map<std::string, std::vector<int>> tainted_instructions;
    PrintMemoryWrites() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      int inst_counter = 0;
      std::srand(std::time(nullptr)); // initialize random seed
      LLVMContext &Context = F.getContext();
      readTaintAnalysis("test.txt");
      return false;
      for (auto &BB : F) {
        for (auto &I : BB) {
          if (auto *store = dyn_cast<StoreInst>(&I)) { 
            if (tainted_instructions.find(F->getName()) != tainted_instructions.end() && 
                std::find(tainted_instructions[F->getName()].begin(), tainted_instructions[F->getName()].end(), inst_counter) != vec.end()) {
                
              store->print(llvm::outs());
              llvm::outs() << "\n";
              errs() << I << "\n";
              // allocate space for mask
              Value *storedValueType = store->getValueOperand();
              int store_size = dyn_cast<IntegerType>(storedValueType->getType())->getBitWidth();
              AllocaInst* maskAlloca = new AllocaInst(storedValueType->getType(), 0, Twine(), store);
              errs() << *maskAlloca << "\n";
              errs() << "mask address: "  << storedValueType << "\n";
              
              // generate mask of store_size bits
              int random_number = std::rand() % int(pow(2, store_size));
              Value* random_number_value = ConstantInt::get(IntegerType::get(Context, store_size), random_number);
              errs() << "random number: " << random_number << "\n";
              // store mask in allocated space
              StoreInst* maskStore = new StoreInst(random_number_value, maskAlloca, store);
              errs() << *maskStore << "\n";

              // apply mask to write
              Instruction* maskInst = BinaryOperator::CreateXor(random_number_value, storedValueType, "xor");
              maskInst->insertBefore(store);
              errs() << *maskInst << '\n';

              // store masked value
              store->setOperand(0, maskInst);
              errs() << *store << '\n';

              errs() << "\n" << "\n";


            }
          }
          inst_counter++;
        }
      }
      return false;
    }

    void readTaintAnalysis(std::string filename) {
      std::ifstream file(filename);
      std::string line;
      if (!file) {
        errs() << "Failed to open " << filename << "\n";
        return;
      }
      while (std::getline(file, line)) {
        std::string delimiter = ",";
        size_t pos = line.find(delimiter);
        if (pos == std::string::npos) {
          std::cerr << "Invalid line format: " << line << '\n';
          continue;
        }
        std::string func_name = line.substr(0, pos);
        int instruction = std::stoi(line.substr(pos + delimiter.length()));
        // Add the instruction to the dictionary
        tainted_instructions[func_name].push_back(instruction);
      }

      // for (const auto& kv : tainted_instructions) {
      //   errs() << kv.first << ": ";
      //   for (const auto& inst : kv.second) {
      //     errs() << inst << ",  ";
      //   }
      //   errs() << '\n';
      // }
    }
  };
}

char PrintMemoryWrites::ID = 0;

static RegisterPass<PrintMemoryWrites> X("print-memory-writes", "Print all memory writes in function", false, false);