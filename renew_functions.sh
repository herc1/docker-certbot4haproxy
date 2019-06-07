#!/bin/bash

function renew_single() {
  certbot certonly --standalone -n -d $1 --force-renewal --agree-tos -m "${MAIL}"
  cat /etc/letsencrypt/live/$1/fullchain.pem /etc/letsencrypt/live/$1/privkey.pem > /opt/output/$1.pem
}