#!/bin/sh

# What platform?
if [[ $OSX_ARCH ]]; then
    target="macosx"
else
    target="generic"
fi

# The makefile mentions using the generic flag
make -f unix/Makefile $target
make -f unix/Makefile prefix=$PREFIX install

