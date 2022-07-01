FROM kihara/across-base:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

RUN cd /across/sequenzia-framework/ && npm install --force youtube-dl

CMD cd /across/sequenzia-framework/ && \
    jq -s '.[0] * .[1]' /across/sequenzia-framework/config.json /across/user-config.json > /across/sequenzia-framework/.config.json && \
    mv /across/sequenzia-framework/.config.json /across/sequenzia-framework/config.json && \
    mv -n /across/node_modules/* /across/sequenzia-framework/node_modules/ && \
    mkdir -p /data/.temp /data/upload /data/.web-upload /data/download && \
    chown -R nobody:nogroup /data/.temp /data/upload /data/.web-upload /data/download && \
    chmod -R 777 /data/.temp /data/upload /data/.web-upload /data/download && \
    git pull --rebase && \
    /wait && node js/fileworker.js
