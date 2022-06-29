FROM acr/across-kanmi:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

CMD /wait \
&& cd /across/sequenzia-framework/ \
&& mkdir -p /data/.temp /data/upload /data/.web-upload /data/download \
&& git pull \
&& node js/fileworker.js
