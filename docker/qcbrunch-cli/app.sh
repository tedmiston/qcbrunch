#!/usr/bin/env bash
set -Eeuo pipefail

export PATH="/github/home/.local/bin:${PATH}"

apt-get update && apt-get install git --yes

# python -m pip install --user --upgrade pip
python -m pip install --user --editable qcbrunch-cli

qcbrunch clean
qcbrunch render
qcbrunch build

ls -alR build
