FROM nginx:1.15

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list

RUN apt-get -y update 

RUN apt-get -y upgrade

RUN apt-get -y install certbot -t stretch-backports

RUN apt-get -y install cron procps

RUN mkdir /opt/output

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]