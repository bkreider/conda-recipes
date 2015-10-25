#!/bin/bash

LIBRARY=$PREFIX/Library/AutoPkg

# backup any old keys
defaults rename com.github.autopkg CACHE_DIR OLD_CACHE_DIR  || /usr/bin/true
defaults rename com.github.autopkg RECIPE_SEARCH_DIRS OLD_RECIPE_SEARCH_DIRS  || /usr/bin/true
defaults rename com.github.autopkg RECIPE_OVERRIDE_DIRS OLD_RECIPE_OVERRIDE_DIRS  || /usr/bin/true
defaults rename com.github.autopkg RECIPE_REPO_DIR OLD_RECIPE_REPO_DIR  || /usr/bin/true

# This sets the defaults for autopkg **SYSTEM WIDE** to be in this conda environment
defaults write com.github.autopkg CACHE_DIR "$LIBRARY/Cache"
defaults write com.github.autopkg RECIPE_SEARCH_DIRS "$LIBRARY/Recipes"
defaults write com.github.autopkg RECIPE_OVERRIDE_DIRS "$LIBRARY/RecipeOverrides"
defaults write com.github.autopkg RECIPE_REPO_DIR "$LIBRARY/RecipeRepos"

# If we install munki-server this will be created
defaults write com.github.autopkg MUNKI_REPO $PREFIX/html/munki_repo
