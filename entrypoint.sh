#!/bin/bash

yes | cp -f /etc/letsencrypt/crontab /etc/crontab 2> /dev/null
certbot register --email "${MAIL}" --no-eff-email  --agree-tos
cron -f