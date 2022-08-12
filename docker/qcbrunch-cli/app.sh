#!/usr/bin/env bash
set -Eeuo pipefail

export PATH="/github/home/.local/bin:${PATH}"

apt-get update && apt-get install git --yes

# python3 -m pip install --upgrade pip
python3 -m pip install --editable qcbrunch-cli

qcbrunch clean
qcbrunch render
qcbrunch build

ls -alR build
