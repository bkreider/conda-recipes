#!/bin/bash

./configure --prefix=$PREFIX --with-ssl=$PREFIX
make
make install
