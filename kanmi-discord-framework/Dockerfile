FROM acr/across-kanmi:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

CMD /wait \
&& cd /across/sequenzia-framework/ \
&& git pull \
&& node js/discord.js
