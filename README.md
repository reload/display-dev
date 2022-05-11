# Experimental OS2Display v2 Dev setup

## Prerequisites

- [mkcert](https://github.com/FiloSottile/mkcert)
- [Docker](https://docs.docker.com/engine/install)
- [Task](https://taskfile.dev)

## Getting startet

```shell
# We have separate tasks for handling traefik a developer may want to handle
# the operation of a local development proxy separate from the reset flow of
# the app containers.
$ task traefik:reset

# Then perform a full reset.
$ task reset
```
