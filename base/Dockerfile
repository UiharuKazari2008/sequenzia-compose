FROM node:14-stretch-slim

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive
ENV WAIT_VERSION 2.7.2

# If your running a custom fork, set it here
ENV BRANCH_FRAMEWORK main
ENV BRANCH_WEB main
ENV BRANCH_INDEX main
ENV BRANCH_WATCHDOG master
ENV BRANCH_RANDOMIZER master

ENV REPO_FRAMEWORK "https://github.com/UiharuKazari2008/kanmi"
ENV REPO_WEB "https://github.com/UiharuKazari2008/sequenzia"
ENV REPO_INDEX "https://github.com/UiharuKazari2008/sequenzia-intellidex"
ENV REPO_WATCHDOG "https://github.com/UiharuKazari2008/kanmi-watchdog"
ENV REPO_RANDOMIZER "https://github.com/UiharuKazari2008/sequenzia-random-bot"

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait

# Install Base Packages
# Make Wait Executable
# Make sure Split is actually installed
# Get Source and Install dependencies + YouTube DL
COPY framework/* /across/.framework/
COPY web/* /across/.web/
COPY watchdog/* /across/.watchdog/
COPY honey/* /across/.honey/

RUN apt update && apt install -y git curl wget ffmpeg libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev \
    librsvg2-dev openssl jq make g++ libvips-dev mysql-client par2 && \
    chmod +x /wait && /usr/bin/split --version && /usr/bin/par2 -V && \
    git clone -b $BRANCH_FRAMEWORK "$REPO_FRAMEWORK" /across/sequenzia-framework && \
    cd /across/sequenzia-framework && npm install && cp -r ../.framework/* ./ && rm -rf ../.framework && \
    git clone -b $BRANCH_WEB "$REPO_WEB" /across/sequenzia-web && \
    cd /across/sequenzia-web && npm install && cp -r ../.web/* ./ && \
    git clone -b $BRANCH_INDEX "$REPO_INDEX" /across/sequenzia-intellidex && \
    cd /across/sequenzia-intellidex && npm install && cp -r ../.web/*.json ./ && rm -rf ../.web && \
    git clone -b $BRANCH_WATCHDOG "$REPO_WATCHDOG" /across/watchdog && \
    cd /across/watchdog && npm install && cp -r ../.watchdog/* ./ && rm -rf ../.watchdog && \
    git clone -b $BRANCH_RANDOMIZER "$REPO_RANDOMIZER" /across/honey && \
    cd /across/honey && npm install && cp -r ../.honey/* ./ && rm -rf ../.honey \
