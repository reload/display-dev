#!/usr/bin/env bash
#
# Name
#
# Description

set -euo pipefail
IFS=$'\n\t'

docker compose down || true
cp ../../etc/api_.env.dev.local ./.env.dev.local
cp ../../etc/api_docker-compose.override.yml ./docker-compose.override.yml
docker compose up -d
docker compose exec phpfpm composer install
test -f config/jwt/private.pem || docker compose exec phpfpm bin/console lexik:jwt:generate-keypair
docker compose exec phpfpm bin/console doctrine:migrations:migrate --no-interaction
docker compose exec phpfpm bin/console app:user:add user@example.com password user
docker compose exec phpfpm bin/console app:user:add --admin admin@example.com password admin
