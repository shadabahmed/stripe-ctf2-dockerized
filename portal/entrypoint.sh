#!/bin/bash

set -eu

for i in {1..3};
do
sed 's/PASSWORD=//' "env/level0$((i - 1))" | \
    xargs -I% htpasswd -bc "/etc/nginx/.level0${i}_htpasswd" user "%"
cat <<-CONFIG >> level_configs.txt

  location /level0${i}/ {
    auth_basic "Please enter username as user and password for level ${i}";
    proxy_pass http://level0${i}:8000/;
    proxy_redirect ~(^.*)/(.*)$ /level0${i}/\$2;
    auth_basic_user_file /etc/nginx/.level0${i}_htpasswd;
  }

CONFIG
done

sed $'/\$LEVEL_CONFIGS/ {r level_configs.txt\n d}' \
  portal.conf.tmpl > /etc/nginx/conf.d/portal.conf

cat /etc/nginx/conf.d/portal.conf
exec /usr/sbin/nginx -g "daemon off;"
