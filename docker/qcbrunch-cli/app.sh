#!usr/bin/env bash
set -Eeuo pipefail

pip install -e qcbrunch-cli

ls -al

qcbrunch --help
