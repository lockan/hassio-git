FROM balenalib/raspberry-pi-alpine:latest

RUN install_packages git openssh

VOLUME /homeassistant
WORKDIR /homeassistant
