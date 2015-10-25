#!/bin/bash

if [ `uname` == Darwin ]; then
    ./Configure darwin64-x86_64-cc shared --prefix=$PREFIX
else
    ./config shared --prefix=$PREFIX
fi

make
make install

rm -rf $PREFIX/bin $PREFIX/ssl
