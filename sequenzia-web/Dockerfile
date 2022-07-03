FROM kihara/across-base:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

COPY public/ /across/public/
RUN cd /across/public && cp -rf ./* /across/sequenzia-web/public/ && rm -rf ./*

CMD cd /across/sequenzia-web/ && \
    jq -s '.[0] * .[1]' /across/sequenzia-web/config.json /across/user-config.json > /across/sequenzia-web/.config.json && \
    mv /across/sequenzia-web/.config.json /across/sequenzia-web/config.json && \
    jq -s '.[0] * .[1]' /across/sequenzia-web/host.config.json /across/user-config.json > /across/sequenzia-web/.host.config.json && \
    mv /across/sequenzia-web/.host.config.json /across/sequenzia-web/host.config.json && \
    jq -s '.[0] * .[1]' /across/sequenzia-web/web.config.json /across/user-config.json > /across/sequenzia-web/.web.config.json && \
    mv /across/sequenzia-web/.web.config.json /across/sequenzia-web/web.config.json && \
    git pull && \
    /wait && node start.js

EXPOSE 3000/tcp
