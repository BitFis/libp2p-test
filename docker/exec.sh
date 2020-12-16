#!/bin/bash
set -e

die() {
  echo "Error: $@"
  exit 1
}

service=$1 && shift || die "Please provide service (arg1)"

cd $(dirname ${BASH_SOURCE[0]})/../
docker-compose exec $service /bin/bash
