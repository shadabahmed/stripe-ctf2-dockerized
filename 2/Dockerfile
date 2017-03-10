FROM php:5.6

ADD . /app
WORKDIR /app
RUN ./ctf-install.sh \
    && mkdir uploads
CMD ./ctf-run.sh
