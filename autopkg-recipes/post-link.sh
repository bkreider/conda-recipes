#!/bin/bash

LIBRARY=$PREFIX/Library/AutoPkg

defaults write  com.github.autopkg RECIPE_SEARCH_DIRS  -array-add $LIBRARY/RecipeRepos/$PKG_NAME
