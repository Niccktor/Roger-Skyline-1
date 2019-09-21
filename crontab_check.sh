#!/bin/bash

cat /etc/crontab > /root/.crontab_tmp
DIFF=$(diff crontab crontab_tmp)
if ["$DIFF" != "" ]; then
	echo "Crontab has been modify" | mail -s 'Alerte' root
	cat /etc/crontab > /root/.crontab
fi
rm /root/.crontab_tmp
