#!/bin/bash

# Set the OPENSSL prefix so it doesn't link to /usr/lib/libssl
OPENSSL_PATH=$PREFIX $PYTHON setup.py install

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
