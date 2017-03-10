FROM nginx

RUN rm /etc/nginx/conf.d/*
ADD portal/portal.conf /etc/nginx/conf.d/
ADD portal/html /usr/share/nginx/html
