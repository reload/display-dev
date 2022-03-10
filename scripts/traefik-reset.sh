#!/usr/bin/env bash
#
# Name
#
# Description

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_DIR}/../traefik"
docker network create frontend 2>/dev/null|| true
docker compose down -v
docker compose up -d
