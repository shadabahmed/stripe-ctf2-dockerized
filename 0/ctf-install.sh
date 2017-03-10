#!/bin/bash
#
# Install the level.
#

set -o nounset
set -o errexit

# This is black magic, but prevents sqlite3 installation from failing due to
# node-gyp permission issues.
npm config set user 0
npm config set unsafe-perm true

# Install.
npm install --loglevel=info
