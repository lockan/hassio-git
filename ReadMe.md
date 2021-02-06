# hassio-git

Just a simple git runner image.

Uses `balenalib/raspberry-pi-alpine:latest` as a base image and installs `git`.

Defines a volume `/homeassistant` to be used as a bind mount location.

## Wait, but why?

I wanted a way to manage my hass.io config folder as a git repository, but hass.io has no package manager on the host os and does not pre-install git.

But! hass.io does run docker.

This runner container can be used to mount your hass.io config folder from the host and then run git operations like you normally would.

## QUICKLAUNCH

`docker run -it -v /mnt/data/supervisor/homeassistant:/homeassistant -v /mnt/data/supervisor/ssl:/ssl lockan/hassio-git sh`

## !! WARNING !!

This thing has root access and runs as the root user. Use with caution. 
Best for private/hobby/dev use only; Do not run in production environments! 

## Other Setup

- Need to store a github private deploy key under `/ssl` on the host called `deploy-hassio-git.key`
- Public half of the key should be added to the target github repo as a deploy key
- Mount the ssl folder to `/ssl` when running the container so github can access it.

## Usage

I would recommend using the hass.io configurator to edit your configs, and only using this container to do commits/pushes to back those up.

1. ssh to the hass.io host on port 22222
1. `$> login`
1. `docker inspect homeassistant` to see the bind mount source paths for homeassistant. Look for the 'config' mount, note the host path. (e.g. /mnt/data/supervisor/homeassistant)
1. Repeat the above - looking for the `ssl` mount. Again, take note of the path.
1. `docker run -it -v /path/to/host/config:/homeassistant -v /path/to/host/ssl:/ssl lockan/hassio-git sh`
1. Do git things as needed.
