#!/bin/bash

# Taken from conda-forge::protobuf

if [ "$(uname)" == "Darwin" ];
then
    # Switch to clang with C++11 ASAP.
    export MACOSX_VERSION_MIN=10.7
    export CC=clang
    export CXX=clang++
    export CXXFLAGS="-mmacosx-version-min=${MACOSX_VERSION_MIN}"
    export CXXFLAGS="${CXXFLAGS} -stdlib=libc++ -std=c++11"
    export LIBS="-lc++"
elif [ "$(uname)" == "Linux" ];
then
    export CC=gcc
    export CXX=g++
    export CXXFLAGS="-I$PREFIX/include"
    export LDFLAGS="-L$PREFIX/lib"
fi

# I'm not sure why this isn't found on the $PATH
#export PKG_CONFIG=$PREFIX/bin/pkg-config

./configure --prefix=$PREFIX --exec_prefix=$PREFIX

# use this for debugging
make SHELL="/bin/bash -x"

make install

