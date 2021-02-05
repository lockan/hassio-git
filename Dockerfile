FROM balenalib/raspberry-pi-alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add git -q

VOLUME /homeassistant
WORKDIR /homeassistant