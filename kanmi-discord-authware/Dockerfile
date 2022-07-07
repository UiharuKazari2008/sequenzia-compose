FROM kihara/across-base:v20

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive

CMD cd /across/sequenzia-framework/ && \
    jq -s '.[0] * .[1]' /across/sequenzia-framework/base.config.json /across/user-config.json > /across/sequenzia-framework/config.json && \
    /wait && \
    cd install && node inital-setup.js && \
    echo "# .env\n#READ THE WIKI BEFORE EDITS\n#SETUP_TYPE='storage'\n#SETUP_SERVERID=''" > /across/setup-authware.env && \
    cd ../ && node js/authware.js
