#!/usr/bin/env bash
#
# Name
#
# The script must be executed with a clone of display-client as current
# working dir.

set -euo pipefail
IFS=$'\n\t'

docker compose down || true
cp ../../etc/display_config.json ./public/config.json
cp ../../etc/display_docker-compose.override.yml ./docker-compose.override.yml
docker-compose run templates npm install
docker-compose run node yarn install
docker compose up -d
docker-compose run node yarn install
