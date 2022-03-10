#!/usr/bin/env bash
#
# Name
#
# The script must be executed with a clone of display-admin-client as current
# working dir.

set -euo pipefail
IFS=$'\n\t'

docker compose down || true
cp ../../etc/admin_config.json ./public/config.json
cp ../../etc/admin_docker-compose.override.yml ./docker-compose.override.yml

docker compose up -d
docker-compose run node yarn install
