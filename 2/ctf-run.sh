#!/bin/bash
#
# Run the level.
#

set -o nounset
set -o errexit

echo "${PASSWORD}" > "password.txt"
php -t "." -S 0.0.0.0:8000 "routing.php"
