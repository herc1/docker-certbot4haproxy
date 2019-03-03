#!/bin/bash

yes | cp -f /etc/letsencrypt/crontab /etc/crontab 2> /dev/null

certbot register --email "${MAIL}" --no-eff-email  --agree-tos
cron -f &
#service nginx start

while true; do
 if [ $(pgrep cron | wc -l) -eq 0 ]
 then
  echo "cron is not running. Starting daemon"
  cron -f &
 fi
 if [ $(pgrep nginx | wc -l) -eq 0 ]
 then
  #service nginx start
 fi
 sleep 5 
done