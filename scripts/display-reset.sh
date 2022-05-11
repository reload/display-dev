#!/usr/bin/env bash
#
# Name
#
# The script must be executed with a clone of display-client as current
# working dir.

set -euo pipefail
IFS=$'\n\t'

docker compose down -v || true
cp ../../etc/display_config.json ./public/config.json
cp ./public/example_release.json ./public/release.json
cp ../../etc/display_docker-compose.override.yml ./docker-compose.override.yml
docker-compose run node yarn install
docker compose up -d
