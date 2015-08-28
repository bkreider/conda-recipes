#!/bin/bash

# needed for tmux to find libevent
# LIBEVENT_CFLAGS and LIBEVENT_LIBS ENV variables do not work
EXTRA_FLAGS="CFLAGS=-I$PREFIX/include LDFLAGS=-L$PREFIX/lib"
./configure --prefix=$PREFIX $EXTRA_FLAGS
make -j
make install
