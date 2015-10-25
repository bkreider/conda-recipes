#!/bin/bash

# Quiet conda-build warning linking against lib
mkdir $PREFIX/lib

gcc -O -o pstree pstree.c
mkdir -p $PREFIX/bin
cp pstree $PREFIX/bin

