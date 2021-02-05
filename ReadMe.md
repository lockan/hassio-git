# hassio-git

Just a simple git runner image.

Uses `balenalib/raspberry-pi-alpine:latest` as a base image and installs `git`.

Defines a volume `/homeassistant` to be used as a bind mount location.

## QUICKLAUNCH

`docker run -it -v /mnt/data/supervisor/homeassistant:/homeassistant lockan/hassio-git sh`

## Wait, but why?

I wanted a way to manage my hass.io config folder as a git repository, but hass.io has no package manager on the host os and does not pre-install git.

But! hass.io does run docker.

This runner container can be used to mount your hass.io config folder from the host and then run git operations like you normally would.

## Usage

I would recommend using the hass.io configurator to edit your configs, and only using this container to do commits/pushes to back those up.

1. ssh to the hass.io host on port 22222
1. `$> login`
1. `docker inspect homeassistant` to see the bind mount source paths for homeassistant. Look for the 'config' mount, note the host path. (e.g. /mnt/data/supervisor/homeassistant)
1. `docker run -it -v /path/to/host/config:/homeassistant hassio-git`
1. Do git things as needed.
