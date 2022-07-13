FROM node:14-stretch-slim

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive
ENV WAIT_VERSION 2.7.2

# If your running a custom fork, set it here
ENV GIT_BRANCH prerelease
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
    chmod +x /wait && /usr/bin/split --version && /usr/bin/par2 -V

RUN git clone -b $GIT_BRANCH "$REPO_FRAMEWORK" /across/sequenzia-framework && \
    git clone -b $GIT_BRANCH "$REPO_WEB" /across/sequenzia-web && \
    git clone "$REPO_INDEX" /across/sequenzia-intellidex && \
    git clone "$REPO_WATCHDOG" /across/watchdog && \
    git clone "$REPO_RANDOMIZER" /across/honey

RUN cd /across/sequenzia-framework && npm install && cp -r ../.framework/* ./ && rm -rf ../.framework
RUN cd /across/sequenzia-web && npm install && cp -r ../.web/* ./
RUN cd /across/sequenzia-intellidex && npm install && cp -r ../.web/*.json ./ && rm -rf ../.web
RUN cd /across/watchdog && npm install && cp -r ../.watchdog/* ./ && rm -rf ../.watchdog
RUN cd /across/honey && npm install && cp -r ../.honey/* ./ && rm -rf ../.honey
