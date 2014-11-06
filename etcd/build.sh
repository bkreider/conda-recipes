#!/bin/bash

./build

mkdir $PREFIX/bin
cp bin/etcd $PREFIX/bin
