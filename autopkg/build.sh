#!/bin/bash

# This should be a setup.py, but they do it all manually bc they want to build a pkg
# This should be turned into a python package but following their own install script
# https://github.com/autopkg/autopkg/blob/master/Scripts/install.sh
# Not installing daemon though

INSTALL_DIR=$PREFIX/lib/AutoPkg

mkdir -p -m 0755 "$INSTALL_DIR"
mkdir -m 0755 "$INSTALL_DIR/autopkglib"
mkdir -m 0755 "$INSTALL_DIR/autopkglib/github"
mkdir -m 0755 "$INSTALL_DIR/autopkgserver"
mkdir -m 0755 "$INSTALL_DIR/FoundationPlist"

## Add new CACHE PATHS inside $PREFIX
# These will be used by other packages -- empty to start with so we add a .gitkeep
LIBRARY=$PREFIX/Library/AutoPkg
mkdir -p -m 0755 "$LIBRARY/Cache"
touch "$LIBRARY/Cache/.gitkeep"
mkdir -m 0755 "$LIBRARY/Recipes"
touch "$LIBRARY/Recipes/.gitkeep"
mkdir -m 0755 "$LIBRARY/RecipeOverrides"
touch "$LIBRARY/RecipeOverrides/.gitkeep"
mkdir -m 0755 "$LIBRARY/RecipeRepos"
touch "$LIBRARY/RecipeRepos/.gitkeep"

cp Code/autopkg "$INSTALL_DIR/"

mkdir $PREFIX/bin
ln -sf "$INSTALL_DIR/autopkg" $PREFIX/bin/autopkg
ln -sf $PREFIX/bin/autopkg $PREFIX/bin/conda-autopkg

# Copy library
cp Code/autopkglib/*.py "$INSTALL_DIR/autopkglib/"
cp Code/autopkglib/github/*.py "$INSTALL_DIR/autopkglib/github"
cp Code/autopkglib/version.plist "$INSTALL_DIR/autopkglib/"

#echo "Copying server"
cp Code/autopkgserver/autopkgserver "$INSTALL_DIR/autopkgserver/"
cp Code/autopkgserver/autopkginstalld "$INSTALL_DIR/autopkgserver/"
cp Code/autopkgserver/*.py "$INSTALL_DIR/autopkgserver/"
cp Code/autopkgserver/autopkgserver.plist "$LAUNCH_DAEMON_PKGSERVER"
cp Code/autopkgserver/autopkginstalld.plist "$LAUNCH_DAEMON_INSTALLD"

#echo "Copying FoundationPlist"
cp Code/FoundationPlist/*.py "$INSTALL_DIR/FoundationPlist/"

# Skip this since we require root and won't run daemons
#echo "Setting permissions"
#find "$INSTALL_DIR" -type f -exec chmod 755 {} \;
#chown -hR root:wheel "$INSTALL_DIR"

# DO NOT INSTALL DAEMONS -- these run as root -- user will have to use sudo instead
#echo "Installing Launch Daemons"
#launchd_load "$LAUNCH_DAEMON_PKGSERVER"
#launchd_load "$LAUNCH_DAEMON_INSTALLD"
