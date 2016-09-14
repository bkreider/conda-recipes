#!/bin/bash

./configure --prefix=$PREFIX --with-ssl=openssl
make
make install
