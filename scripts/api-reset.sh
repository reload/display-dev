#!/usr/bin/env bash
#
# Name
#
# Description

set -euo pipefail
IFS=$'\n\t'

docker compose down -v || true
cp ../../etc/api_.env.dev.local ./.env.dev.local
cp ../../etc/api_docker-compose.override.yml ./docker-compose.override.yml
docker compose up -d

# See the following for the source of the commands below:
# https://github.com/os2display/display-docs/blob/develop/hosting.md#general-hosting
docker compose exec phpfpm composer install
test -f config/jwt/private.pem || docker compose exec phpfpm bin/console lexik:jwt:generate-keypair
docker compose exec phpfpm bin/console doctrine:migrations:migrate --no-interaction
docker compose exec phpfpm bin/console app:tenant:add testTenantKey "Local Dev Setup Default tenant" "Description of Local Dev Setup"

# Create an unprivileged and privileged users
# Usage: app:user:add <email> <password> <description>
docker compose exec phpfpm bin/console app:user:add user@example.com password user
docker compose exec phpfpm bin/console app:user:add --admin admin@example.com password admin
