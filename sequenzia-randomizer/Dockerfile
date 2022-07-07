FROM kihara/across-base:v20

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive

CMD cd /across/honey/ && \
    jq -s '.[0] * .[1] | . + {"token": .Randomizer_Key}' /across/honey/base.config.json /across/user-config.json > /across/honey/config.json && \
    /wait && node index.js
