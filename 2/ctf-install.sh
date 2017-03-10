#!/bin/bash
#
# Install the level.
#

set -o nounset
set -o errexit

apt-get update
apt-get install -y uuid
