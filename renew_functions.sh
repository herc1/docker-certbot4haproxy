#!/bin/bash

function renew_single() {
  certbot certonly --standalone -d $1
  cat /etc/letsencrypt/live/$1/cert.pem /etc/letsencrypt/live/$1/privkey.pem > /etc/ssl/$1.pem
}