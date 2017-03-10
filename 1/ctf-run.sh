#!/bin/bash
#
# Run the level.
#

set -o nounset
set -o errexit

UUID=`uuid -v4`

echo "${PASSWORD}" > "level02-password.txt"
echo "${UUID}" > "secret-combination.txt"

php -t "." -S 0.0.0.0:8000 "routing.php"
