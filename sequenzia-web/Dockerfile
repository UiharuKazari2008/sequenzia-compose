FROM acr/across-kanmi:latest

LABEL maintainer="Yukimi Kazari <kazari@acr.moe>"

ENV DEBIAN_FRONTEND noninteractive

COPY public/* /across/sequenzia-web/public/

CMD /wait \
&& cd /across/sequenzia-web/ \
&& git pull \
&& node start.js
EXPOSE 3000/tcp
