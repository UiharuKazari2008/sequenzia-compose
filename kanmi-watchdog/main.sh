#!/bin/sh

if [ "${WATCHDOG_ENABLE_BOT}" = 'true' ]
then
	/wait
	cd /across/watchdog || exit
	node js/index.js
else
	tail -f /dev/null
fi
