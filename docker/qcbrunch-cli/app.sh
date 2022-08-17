#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="/github/home/.local/bin:${PATH}"

apt-get update
apt-get install git --yes

pip install --user --upgrade \
  pip \
  build

cd qcbrunch-cli
python -m build --wheel
pip install dist/qcbrunch-*.whl
cd -

qcbrunch clean
qcbrunch render
qcbrunch build

ls -alR build
