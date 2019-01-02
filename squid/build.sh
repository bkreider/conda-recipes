#!/bin/bash

# OSX 10.11 flags
# Prevents ldap from breaking the build on osx
./configure --prefix=$PREFIX \
            --with-openssl=$PREFIX/lib \
            --without-mit-krb5 \
            --without-heimdal-krb5 \
            --disable-auth \
            --with-krb5-config=no \
            --disable-external-acl-helpers \
            --disable-eui

make
make -j4 install
