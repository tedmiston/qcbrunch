#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="/github/home/.local/bin:${PATH}"

apt-get update && apt-get install git --yes

sudo pip3 install --upgrade pip
sudo pip3 install --editable qcbrunch-cli

qcbrunch clean
qcbrunch render
qcbrunch build

ls -alR build
