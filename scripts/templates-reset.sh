#!/usr/bin/env bash
#
# Reset the templates develop setup
#
# The script must be executed with a clone of display-templates as current
# working dir.

set -euo pipefail
IFS=$'\n\t'

docker compose down -v || true

cp ../../etc/templates_docker-compose.override.yml ./docker-compose.override.yml

docker-compose run node npm install
docker compose up -d
