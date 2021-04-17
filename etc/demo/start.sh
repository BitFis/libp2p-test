#!/bin/bash

SCRIPT_DIR="$( dirname "${BASH_SOURCE[0]}" )"

# Start tmuxinator and
pushd $SCRIPT_DIR/../../
docker-compose up -d
popd

pushd $SCRIPT_DIR/
tmuxinator local
popd
