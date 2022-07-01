FROM kihara/across-base:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

RUN cd /across/sequenzia-framework/ && npm install --force youtube-dl

CMD cd /across/sequenzia-framework/ && \
    jq -s '.[0] * .[1]' /across/sequenzia-framework/config.json /across/user-config.json > /across/sequenzia-framework/.config.json && \
    mv /across/sequenzia-framework/.config.json /across/sequenzia-framework/config.json && \
    mkdir -p /data/.temp /data/upload /data/.web-upload /data/download || true && \
    chown -R nobody:nogroup /data/.temp /data/upload /data/.web-upload /data/download || true  && \
    chmod -R 777 /data/.temp /data/upload /data/.web-upload /data/download || true  && \
    git pull && \
    /wait && node js/fileworker.js
