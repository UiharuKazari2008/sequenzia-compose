FROM mysql:8-oracle

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV WAIT_VERSION 2.7.2

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait

COPY backup.sh /backup.sh
COPY restore.sh /restore.sh
COPY base_v20.sql /docker-entrypoint-initdb.d/setup.sql

RUN chmod +x /wait
