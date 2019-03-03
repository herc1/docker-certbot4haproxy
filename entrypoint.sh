#!/bin/bash
touch /tmp/stdout
tail -f /tmp/stdout &
yes | cp -f /etc/letsencrypt/crontab /etc/crontab 2> /dev/null
certbot register --email "${MAIL}" --no-eff-email  --agree-tos >> /tmp/stdout 2>&1 &
cron -f