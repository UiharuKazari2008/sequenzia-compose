FROM kihara/across-base:v20

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive

CMD cd /across/sequenzia-intellidex/ && \
    jq -s '.[0] * .[1] | . + {"watchdog_host": .Watchdog_Host} | . + {"watchdog_id": .Watchdog_ID}' /across/sequenzia-intellidex/base.host.config.json /across/user-config.json > /across/sequenzia-intellidex/config.json && \
    /wait && node index.js
