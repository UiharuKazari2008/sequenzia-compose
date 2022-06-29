FROM acr/across-kanmi:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

CMD /wait \
&& cd /across/sequenzia-framework/ \
&& rm -rf ./tmp \
&& mkdir -p /data/.temp /data/upload /data/.web-upload /data/download \
&& ln -s /data/.temp/ ./tmp \
&& ln -s /data/upload/ ./upload \
&& ln -s /data/.web-upload/ ./web-upload \
&& ln -s /data/download/ ./download \
&& git pull \
&& node js/fileworker.js
