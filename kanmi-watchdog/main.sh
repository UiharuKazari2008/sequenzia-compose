#!/bin/sh
/wait
if [ "${WATCHDOG_ENABLE_BOT}" = 'true' ]; then
	cd /across/watchdog || exit
	node js/index.js
else
	tail -f /dev/null
fi
