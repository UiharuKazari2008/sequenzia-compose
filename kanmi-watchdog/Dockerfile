FROM node:14-alpine AS node
FROM alpine:3.16.0

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV WAIT_VERSION 2.7.2
ENV GIT_BRANCH prerelease

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
ADD ./crontab /across/crontab
ADD ./backup.sh /across/backup.sh
ADD ./main.sh /main.sh

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

# Install Base
RUN mkdir -p /across && chmod +x /wait && \
    apk add --no-cache git curl mysql-client && \
    git clone "https://github.com/UiharuKazari2008/kanmi-watchdog" /across/watchdog && \
    cd /across/watchdog && npm install && \
    crontab /across/crontab

CMD sh /main.sh
