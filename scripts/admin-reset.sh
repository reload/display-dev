#!/usr/bin/env bash
#
# Name
#
# The script must be executed with a clone of display-admin-client as current
# working dir.

set -euo pipefail
IFS=$'\n\t'

docker compose down -v || true
test -f ./public/config.json || cp ../../etc/admin_config.json ./public/config.json
test -f ./public/access-config.json || cp ./public/example-access-config.json ./public/access-config.json

cp ../../etc/admin_docker-compose.override.yml ./docker-compose.override.yml

docker-compose run node yarn install
docker compose up -d
