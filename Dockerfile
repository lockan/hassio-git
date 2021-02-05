FROM balenalib/raspberry-pi-alpine:latest

RUN install_packages git

VOLUME /homeassistant
WORKDIR /homeassistant