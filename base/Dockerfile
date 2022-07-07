FROM node:14-alpine AS node
FROM alpine:3.16.0

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive
ENV WAIT_VERSION 2.7.2

# If your running a custom fork, set it here
ENV GIT_BRANCH prerelease
ENV REPO_FRAMEWORK "https://github.com/UiharuKazari2008/kanmi"
ENV REPO_WEB "https://github.com/UiharuKazari2008/sequenzia"
ENV REPO_WATCHDOG "https://github.com/UiharuKazari2008/kanmi-watchdog"
ENV REPO_RANDOMIZER "https://github.com/UiharuKazari2008/sequenzia-random-bot"

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait

# Install Node.js from another image
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

# Install Base Packages
# Make Wait Executable
# Make sure Split is actually installed
# Get Source and Install dependencies + YouTube DL
COPY framework/* /across/.framework/
COPY web/* /across/.web/
COPY watchdog/* /across/.watchdog/
COPY honey/* /across/.honey/

RUN apk add git curl wget ffmpeg pango-dev jpeg-dev giflib-dev openssl jq make g++ vips-dev mysql-client && \
    chmod +x /wait && ls /usr/bin/split

RUN git clone -b $GIT_BRANCH "$REPO_FRAMEWORK" /across/sequenzia-framework && \
    git clone -b $GIT_BRANCH "$REPO_WEB" /across/sequenzia-web && \
    git clone "$REPO_WATCHDOG" /across/watchdog && \
    git clone "$REPO_RANDOMIZER" /across/honey

RUN cd /across/sequenzia-framework && git pull && npm install --force youtube-dl && \
    npm install && cp -r ../.framework/* ./  && rm -rf ../.framework
RUN cd /across/sequenzia-web && git pull && npm install && cp -r ../.web/* ./  && rm -rf ../.web
RUN cd /across/watchdog && git pull && npm install && cp -r ../.watchdog/* ./  && rm -rf ../.watchdog
RUN cd /across/honey && git pull && npm install && cp -r ../.honey/* ./  && rm -rf ../.honey
