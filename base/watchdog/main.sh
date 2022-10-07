#!/bin/sh
/wait || exit
echo "Verifying Database Structure..."
mysql -h "$DATABASE_HOST" -u "$DATABASE_USERNAME" -p"$DATABASE_PASSWORD" kanmi_system < /across/compliance_v20.sql
if [ "$(jq -r '.Watchdog_Key' /across/user-config.json | wc -c)" -gt 20 ]; then
	jq -s '.[0] * .[1] | . + {"Discord_Key": .Watchdog_Key} | del(.Authware_Key, .Watchdog_Key, .discord_secret, .cookie_secret)' /across/watchdog/base.config.json /across/user-config.json > /across/watchdog/config.json
	jq -s '.[0] * .[1]' /across/watchdog/base.watchdog.config.json /across/watchdog.user-config.json > /across/watchdog/watchdog.config.json
	cd /across/watchdog || exit
	node js/index.js
else
	echo "## Watchdog is not configured and will be bypassed ##"
	echo "## Please refer to the documentation on configuration ##"
	tail -f /dev/null
fi
