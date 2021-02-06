FROM balenalib/raspberry-pi-alpine:latest

RUN install_packages git openssh

# set up SSH config for github
RUN mkdir /root/.ssh
COPY config /root/.ssh/config
RUN chmod 400 ~/root/.ssh/config

VOLUME /homeassistant
VOLUME /ssl

WORKDIR /homeassistant
