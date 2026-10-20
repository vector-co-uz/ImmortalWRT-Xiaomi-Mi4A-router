#!/bin/sh

# Display the dynamic MOTD once per interactive login session.
case "$-" in
	*i*)
		if [ "${ROUTER_MOTD_SHOWN:-0}" != "1" ] && [ -x /usr/bin/router-status ]; then
			ROUTER_MOTD_SHOWN=1
			export ROUTER_MOTD_SHOWN
			/usr/bin/router-status
		fi
		;;
esac
