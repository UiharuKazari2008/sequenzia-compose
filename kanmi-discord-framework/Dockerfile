FROM kihara/across-base:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

CMD cd /across/sequenzia-framework/ && \
    jq -s '.[0] * .[1]' /across/sequenzia-framework/config.json /across/user-config.json > /across/sequenzia-framework/.config.json && \
    mv /across/sequenzia-framework/.config.json /across/sequenzia-framework/config.json && \
    git pull && \
    /wait && node js/discord.js
