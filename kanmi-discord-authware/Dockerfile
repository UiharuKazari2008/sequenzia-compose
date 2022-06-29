FROM acr/across-kanmi:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

CMD cd /across/sequenzia-framework/ \
&& git pull \
&& cd install \
&& /wait \
&& node inital-setup.js \
&& cd /across/sequenzia-framework/ \
&& node js/authware.js
