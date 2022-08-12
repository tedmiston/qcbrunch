#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="/github/home/.local/bin:${PATH}"

apt-get update
apt-get install git --yes

python -m pip install --user --upgrade \
  pip \
  build

cd qcbrunch-cli
python -m build
pip install dist/qcbrunch-*.whl
cd -

qcbrunch clean
qcbrunch render
qcbrunch build

ls -alR build
