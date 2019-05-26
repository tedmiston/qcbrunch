#!/usr/bin/env bash
set -Eeuo pipefail

pip install -e qcbrunch-cli

qcbrunch clean
qcbrunch render
qcbrunch build

ls -alR build
