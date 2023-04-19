#!/bin/bash

gcc -o toy.o toy.c
llvm-mctoll -d toy.o -I /usr/include/stdio.h -I /usr/include/stdlib.h
