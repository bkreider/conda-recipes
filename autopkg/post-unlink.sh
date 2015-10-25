#/bin/bash

# restore any old keys if possible
defaults rename com.github.autopkg OLD_CACHE_DIR            CACHE_DIR             || /usr/bin/true
defaults rename com.github.autopkg OLD_RECIPE_SEARCH_DIRS   RECIPE_SEARCH_DIRS    || /usr/bin/true
defaults rename com.github.autopkg OLD_RECIPE_OVERRIDE_DIRS RECIPE_OVERRIDE_DIRS  || /usr/bin/true
defaults rename com.github.autopkg OLD_RECIPE_REPO_DIR      RECIPE_REPO_DIR       || /usr/bin/true

