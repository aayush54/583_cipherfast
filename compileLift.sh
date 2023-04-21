#!/bin/bash

gcc -o toy.out toy.c
llvm-mctoll -d toy.o -I /usr/include/stdio.h -I /usr/include/stdlib.h
