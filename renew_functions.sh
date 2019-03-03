#!/bin/bash

function renew_single() {
  certbot certonly --standalone -n -d $1 --force-renewal
  cat /etc/letsencrypt/live/$1/cert.pem /etc/letsencrypt/live/$1/privkey.pem > /opt/output/$1.pem
}