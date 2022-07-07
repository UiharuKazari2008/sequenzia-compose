FROM kihara/across-base:v20

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive

CMD cd /across/sequenzia-framework/ && \
    jq -s '.[0] * .[1]' /across/sequenzia-framework/base.config.json /across/user-config.json > /across/sequenzia-framework/config.json && \
    mkdir -p /data/.temp /data/upload /data/.web-upload /data/download || true && \
    chown -R nobody:nogroup /data/.temp /data/upload /data/.web-upload /data/download || true  && \
    chmod -R 777 /data/.temp /data/upload /data/.web-upload /data/download || true  && \
    /wait && node js/fileworker.js
