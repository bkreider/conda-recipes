#!/bin/bash


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
fi

# Build configure/Makefile as they are not present.
aclocal
libtoolize
autoconf
autoreconf -i
automake --add-missing

./configure --prefix="${PREFIX}" \
        CC="${CC}" \
        CXX="${CXX}" \
        CXXFLAGS="${CXXFLAGS}" \
        LDFLAGS="${LDFLAGS}"
make
make install
