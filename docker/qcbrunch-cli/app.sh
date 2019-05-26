#!/usr/bin/env bash
set -Eeuo pipefail

pip install -e qcbrunch-cli

ls -al

echo QCBRUNCH_ROOT=$QCBRUNCH_ROOT

qcbrunch --help
