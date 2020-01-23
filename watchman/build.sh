#!/bin/bash

./autogen.sh
./configure --prefix $PREFIX

# build errors otherwise
git checkout 061e6ab  thirdparty/jansson

make -j 8
make install

