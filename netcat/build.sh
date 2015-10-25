#!/bin/bash

mkdir -p $PREFIX/{bin,etc,man,share,lib,info_}

./configure --disable-debug --prefix=$PREFIX --infodir=$PREFIX/info_
make install

# Conda bug -- keeps rewriting the symlink and breaking it
rm $PREFIX/bin/nc
cp $PREFIX/bin/netcat $PREFIX/bin/nc
