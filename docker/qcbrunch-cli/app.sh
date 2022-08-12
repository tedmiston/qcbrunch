#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="/github/home/.local/bin:${PATH}"

apt-get update && apt-get install git --yes

pip3 install --upgrade pip
pip3 install --editable qcbrunch-cli

qcbrunch clean
qcbrunch render
qcbrunch build

ls -alR build
