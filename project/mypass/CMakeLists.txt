add_llvm_library(LLVMPJT MODULE # Name of the shared library that you will generate
 mypass.cpp                     # Your pass
 mypass2.cpp                    # print all insts
 mypass3.cpp                    # print all loads
 randpass.cpp
 PLUGIN_TOOL
 opt
)