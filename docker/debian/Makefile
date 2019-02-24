SHELL := /usr/bin/env bash

DEBIAN_VALIDATOR_IMAGE := debian:stable-slim

.PHONY: build-debian-validator
build-debian-validator:
	docker build --no-cache --tag=${DEBIAN_VALIDATOR_IMAGE} --file=docker/debian/Dockerfile .

.PHONY: run-debian-validator
run-debian-validator:
	docker run --rm -it --env-file=docker/debian/.env -v ${ROOT}:/foo --workdir=/foo ${DEBIAN_VALIDATOR_IMAGE}

.PHONY: debug-debian-validator
debug-debian-validator:
	docker run --rm -it --env-file=docker/debian/.env -v ${ROOT}:/foo --workdir=/foo ${DEBIAN_VALIDATOR_IMAGE} sh
