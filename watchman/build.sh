#!/bin/bash

./autogen.sh
./configure --prefix $PREFIX

# build errors otherwise
# Hack to compile - 20 day old github issue
git checkout 061e6ab  thirdparty/jansson

make -j 8
make install

