#!/bin/bash
set -e
rm -rf *.out
clang -emit-llvm test/$1.c -c -O3 -o test/$1.bc
clang -S -emit-llvm test/$1.c
# mv $1.ll test

opt -enable-new-pm=0 -S -load ./build/mypass/LLVMPJT.so -print-memory-writes < test/$1.bc > test/$1.passed.ll

clang test/$1.passed.ll -O0 -o $1.instr.out
clang test/$1.c -O3 -o $1.out

----
clang -emit-llvm ./.c -c -O3 -o test/$1.bc
