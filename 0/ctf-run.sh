#!/bin/bash
#
# Run the level.
#

set -o nounset
set -o errexit

# Remove the dummy database, and create a new one with the password.
rm -f "level00.db"
node "ctf-install.js" "${PASSWORD}"
node "level00.js"
