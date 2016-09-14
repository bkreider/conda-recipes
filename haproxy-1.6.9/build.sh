#!/bin/bash


# SSL is linked against conda's ssl
# PCRE is linked against the conda library
# ZLIB is probably linked against the system
# TARGET is linux 2.8+
make TARGET=linux2628 \
     USE_OPENSSL=1 \
     SSL_INC=$PREFIX/include \
     SSL_LIB=$PREFIX/lib \
     USE_ZLIB=1 \
     USE_PCRE=1 \
     PCRE_LIB=$PREFIX 

# Prefix:  Where to install man, docs, etc
# SBINDIR: defaults to $PREFIX/usr/sbin, so we make this nicer
make install PREFIX=$PREFIX \
             SBINDIR=$PREFIX/bin
