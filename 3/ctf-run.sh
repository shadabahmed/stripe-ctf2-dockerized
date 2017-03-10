#!/bin/bash
#
# Run the level.
#

set -o nounset
set -o errexit

# These two are just color, no meaning.
PROOF=`uuid -v4`
PLANS=`uuid -v4`

# Set up the the setup code; this should do the right thing as soon as the
# server code runs.
sed -i \
  "s/'dummy-password', 'dummy-proof', 'dummy-plans'/'${PASSWORD}', '${PROOF}', '${PLANS}'/" \
  "secretvault.py"

# Sort out the secrets file.
sed -i \
  "s/dummy-proof/${PROOF}/" \
  "data/secrets.json"
sed -i \
  "s/dummy-plans/${PLANS}/" \
  "data/secrets.json"
sed -i \
  "s/dummy-password/${PASSWORD}/" \
  "data/secrets.json"

python secretvault.py
