#!/bin/bash

clang -emit-llvm $1.c -c -o $1.bc
opt -enable-new-pm=0 -S -load ./build/mypass/LLVMPJT.so -rand < $1.bc > $1.passed.ll
clang hello_world.passed.ll -o $1.out
"./$1.out"