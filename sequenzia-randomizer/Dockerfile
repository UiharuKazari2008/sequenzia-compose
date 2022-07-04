FROM kihara/across-base:v20

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

CMD cd /across/honey/ && \
    jq -s '.[0] * .[1] | . + {"token": .Randomizer_Key}' /across/honey/base.config.json /across/user-config.json > /across/honey/config.json && \
    git pull && \
    /wait && node index.js
