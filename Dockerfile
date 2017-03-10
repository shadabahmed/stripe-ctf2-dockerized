FROM nginx
WORKDIR /app

RUN rm /etc/nginx/conf.d/* \
    && apt-get update \
    && apt-get install -y apache2-utils

ADD portal/portal.conf.tmpl /app
ADD portal/html /usr/share/nginx/html
ADD portal/entrypoint.sh /app
ADD env /app/env

RUN chmod +x /app/entrypoint.sh
CMD /app/entrypoint.sh
