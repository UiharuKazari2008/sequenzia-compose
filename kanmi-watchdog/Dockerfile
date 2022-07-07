FROM kihara/across-base:v20

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive

# Enable Automatic Tasks
RUN crontab /across/watchdog/crontab

CMD sh /across/watchdog/main.sh
