FROM bitnami/minideb:bullseye AS builder

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

# Install Base
RUN apt update && apt install -y git curl wget build-essential
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt update && apt install -y ffmpeg libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev nodejs openssl
RUN apt clean

# Get Source and Install dependencies
RUN mkdir /across/
RUN git clone -b prerelease "https://github.com/UiharuKazari2008/kanmi" /across/sequenzia-framework
RUN cd /across/sequenzia-framework && npm install --force youtube-dl && npm install
RUN git clone -b prerelease "https://github.com/UiharuKazari2008/sequenzia" /across/sequenzia-web
RUN cd /across/sequenzia-web && npm install

COPY framework/* /across/sequenzia-framework/
COPY web/* /across/sequenzia-web/

# Make docker-compose wait for container dependencies be ready
# Solution 1: use dockerize tool -----------------------------
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# Solution 2: use docker-compose-wait tool -------------------
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait
