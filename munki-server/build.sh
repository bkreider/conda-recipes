#!/bin/bash


INSTALL_DIR=$PREFIX/html/munki_repo

mkdir -p -m 0755 "$INSTALL_DIR"
mkdir -m 0755 "$INSTALL_DIR/catalogs"
mkdir -m 0755 "$INSTALL_DIR/manifests"
mkdir -m 0755 "$INSTALL_DIR/pkgs"
mkdir -m 0755 "$INSTALL_DIR/pkgsinfo"

# These will be used by other packages -- empty to start with so we add a .gitkeep
touch "$INSTALL_DIR/catalogs/.gitkeep"
touch "$INSTALL_DIR/manifests/.gitkeep"
touch "$INSTALL_DIR/pkgs/.gitkeep"
touch "$INSTALL_DIR/pkgsinfo/.gitkeep"

