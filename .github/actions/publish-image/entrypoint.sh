#!/usr/bin/env bash

echo ${INPUT_TOKEN} | docker login --username=${INPUT_USERNAME} --password-stdin docker.pkg.github.com && \
docker push ${INPUT_IMAGE} && \
docker logout docker.pkg.github.com
