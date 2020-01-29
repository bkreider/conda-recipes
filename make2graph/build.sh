#!/bin/bash

# build fails without this directory
mkdir $PREFIX/lib
make all
make install prefix=$PREFIX
