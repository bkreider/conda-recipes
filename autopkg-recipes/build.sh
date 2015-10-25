#!/bin/bash

# just a git checkout and install into the path
# post link will add the path to `defaults`

LIBRARY="$PREFIX/Library/AutoPkg/RecipeRepos/$PKG_NAME"

mkdir -p -m 0755 "$LIBRARY"
cp -r * "$LIBRARY"
