FROM nginx:1-alpine

# Based on https://github.com/caprover/nginx-reverse-proxy

MAINTAINER Yukimi Kazari <kazari@acr.moe>

ENV DEBIAN_FRONTEND noninteractive

RUN apk add openssl certbot jq tini;

COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENV CLIENT_MAX_BODY_SIZE 1G

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
