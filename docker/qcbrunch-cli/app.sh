#!/usr/bin/env bash
set -Eeuo pipefail

pip install --editable qcbrunch-cli

qcbrunch clean
qcbrunch render
qcbrunch build

ls -alR build
