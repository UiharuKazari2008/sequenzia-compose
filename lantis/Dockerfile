FROM alpine:latest

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV WAIT_VERSION 2.7.2
ENV BRANCH_LANTIS master
ENV REPO_LANTIS 'https://github.com/UiharuKazari2008/LANTIS'

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
COPY entrypoint.sh /

RUN chmod +x /wait && chmod +x /entrypoint.sh && \
    apk add --update --no-cache openssh openssh-client bash busybox git curl wget && \
    git clone -b $BRANCH_LANTIS "$REPO_LANTIS" /lantis && \
    rm -rf /lanis/connections && \
    chmod +x /lantis/lantis.bash

COPY sshd_config /etc/ssh/
COPY .lantis.config /lantis/.lantis.config
COPY .watchdog.lantis.config /lantis/.watchdog.lantis.config

CMD /entrypoint.sh
EXPOSE 65200

