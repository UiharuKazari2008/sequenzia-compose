#!/bin/sh
set -e

# Compute the DNS resolvers for use in the templates - if the IP contains ":", it's IPv6 and must be enclosed in []
export RESOLVERS=$(awk '$1 == "nameserver" {print ($2 ~ ":")? "["$2"]": $2}' ORS=' ' /etc/resolv.conf | sed 's/ *$//g')
if [ "x$RESOLVERS" = "x" ]; then
    echo "Error: there is no resolvers!!" >&2
    exit 1
fi

cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.template

export SSL_CERT="/certs/frontend.crt"
export SSL_KEY="/certs/frontend.key"
if [ -n "${EXTERNAL_FQDN}" ] && [ -d "/certs/certbot/live/${EXTERNAL_FQDN}/" ]; then
	export SSL_CERT="/certs/certbot/live/${EXTERNAL_FQDN}/fullchain.pem"
	export SSL_KEY="/certs/certbot/live/${EXTERNAL_FQDN}/privkey.pem"
fi

envsubst '$RESOLVERS $EXTERNAL_FQDN $SSL_CERT $SSL_KEY $CLIENT_MAX_BODY_SIZE $CLIENT_MAX_BODY_SIZE' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

cat /etc/nginx/conf.d/default.conf

exec "$@"
