FROM kihara/across-base:v20

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive

CMD cd /across/sequenzia-web/ && \
    jq -s '.[0] * .[1]' /across/sequenzia-web/base.config.json /across/user-config.json > /across/sequenzia-web/config.json && \
    jq -s '.[0] * .[1] | . + {"watchdog_host": .Watchdog_Host} | . + {"watchdog_id": .Watchdog_ID}' /across/sequenzia-web/base.host.config.json /across/user-config.json > /across/sequenzia-web/host.config.json && \
    jq -s '.[0] * .[1]' /across/sequenzia-web/base.web.config.json /across/user-config.json > /across/sequenzia-web/web.config.json && \
    /wait && node start.js

EXPOSE 3000/tcp
