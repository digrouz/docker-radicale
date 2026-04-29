[![auto-update](https://github.com/digrouz/docker-radicale/actions/workflows/auto-update.yml/badge.svg)](https://github.com/digrouz/docker-radicale/actions/workflows/auto-update.yml)
[![dockerhub](https://github.com/digrouz/docker-radicale/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/digrouz/docker-radicale/actions/workflows/dockerhub.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/digrouz/radicale)

# docker-radicale

Install radicale into an Alpine container

![radicale](https://radicale.org/assets/logo.svg)

## Tag
Several tag are available:
* latest: see alpine
* alpine: [Dockerfile_alpine](https://github.com/digrouz/docker-radicale/blob/master/Dockerfile_alpine)
* Any version specific tag is based on alpine.

## Description
Radicale is a small but powerful CalDAV (calendars, to-do lists) and CardDAV (contacts) server,

http://radicale.org/

## Usage
    docker create --name=radicale \
        -v <path to data>:/data \
        -e UID=<UID default:12345> \
        -e GID=<GID default:12345> \
        -e AUTOUPGRADE=<0|1 default:0> \
        -e TZ=<timezone default:Europe/Brussels> \
        -p 5232:5232 \
    digrouz/radicale
        
## Environment Variables

When you start the `radicale` image, you can adjust the configuration of the `radicale` instance by passing one or more environment variables on the `docker run` command line.

### `UID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `12345`.

### `GID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `12345`.

### `AUTOUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

### `TZ`

This variable is not mandatory and specifies the timezone to be configured within the container. It has default value `Europe/Brussels`.

## Notes

* This container is built using [s6-overlay](https://github.com/just-containers/s6-overlay)
* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e AUTOUPGRADE=1` at container creation.
* An helm chart is available of in the [chart folder](https://github.com/digrouz/docker-radicale/tree/master/chart) with an example [values.yaml](https://github.com/digrouz/docker-radicale/tree/master/chart/values.yaml)

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-radicale/issues)


