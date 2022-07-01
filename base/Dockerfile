FROM bitnami/minideb:bullseye AS builder

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive
ENV WAIT_VERSION 2.7.2
ENV GIT_BRANCH prerelease

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait

# Install Base
RUN apt update && apt install -y git curl wget build-essential && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt update && apt install -y ffmpeg libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev nodejs openssl jq && \
    apt clean && chmod +x /wait

# Get Source and Install dependencies
RUN mkdir /across/ && cd /across && \
    npm install --force youtube-dl && \
    git clone -b $GIT_BRANCH "https://github.com/UiharuKazari2008/kanmi" /across/sequenzia-framework  && \
    cd /across/sequenzia-framework && npm install && \
    git clone -b $GIT_BRANCH "https://github.com/UiharuKazari2008/sequenzia" /across/sequenzia-web && \
    cd /across/sequenzia-web && npm install

COPY framework/* /across/sequenzia-framework/
COPY web/* /across/sequenzia-web/
