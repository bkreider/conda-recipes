#!/bin/bash

# Setup GOPATH crap
export GOPATH="${SRC_DIR}"
GO_BINDATA_SRC="$GOPATH/src/github.com/smallstep/certificates"
mkdir -p $GO_BINDATA_SRC
cp -r "${SRC_DIR}"/* "${GO_BINDATA_SRC}" || true
cp -r "${SRC_DIR}"/.* "${GO_BINDATA_SRC}" || true

# go compiles its system libraries and fails on netdb.h otherwise 
# don't know why
export CGO_ENABLED=0

pushd "${GO_BINDATA_SRC}"
# Need this for deps
export PATH=./bin:$PATH

export GOBIN=$PREFIX/bin
mkdir $PREFIX/bin

make bootstrap
make binary-darwin

mv output/binary/darwin/bin/step-ca $PREFIX/bin/step-ca

# GO installs modules without write preventing conda-build from cleaning up
chmod u+w $GOPATH
