FROM debian:stretch-slim

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list

RUN apt-get -y update 

RUN apt-get -y upgrade

RUN apt-get -y install certbot -t stretch-backports

RUN apt-get -y install cron procps

RUN mkdir /opt/output

COPY crontab /etc/crontab

COPY entrypoint.sh /

COPY renew_functions.sh /

COPY renew_single /

COPY renew_all /

ENTRYPOINT ["/entrypoint.sh"]