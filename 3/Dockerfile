FROM python:2.7

ADD . /app
WORKDIR /app
RUN ./ctf-install.sh \
    && mkdir uploads
CMD ./ctf-run.sh
