#!/bin/bash

certbot register --email "${MAIL}" --no-eff-email  --agree-tos

cron -f &
nginx -g daemon off &

while true; do
 if [ $(pgrep cron | wc -l) -eq 0 ]
 then
  echo "cron is not running. Starting daemon"
  cron -f &
 fi
 if [ $(pgrep nginx | wc -l) -eq 0 ]
 then
  nginx -g daemon off &
 fi
 sleep 5 
done