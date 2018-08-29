FROM debian:latest
MAINTAINER Ruslan Kaliusha <zenderrr12@gmail.com>

RUN apt-get update && apt-get -y install mysql-server mc openssh-server mysql-client --no-install-recommends && rm -r /var/lib/apt/lists/*

COPY ./scripts/*.sh /var/scripts/

RUN chmod 755 /var/scripts/docker-entrypoint.sh

WORKDIR /var/scripts

ENTRYPOINT ["/var/scripts/docker-entrypoint.sh"]

EXPOSE 3306 22