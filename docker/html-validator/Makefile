SHELL := /usr/bin/env bash

HTML_VALIDATOR_IMAGE := tedmiston/qcbrunch-html-validator:latest
HTML_VALIDATOR_ROOT := docker/html-validator

.PHONY: html-validator-build
html-validator-build:
	docker build --no-cache --tag=${HTML_VALIDATOR_IMAGE} --file=${HTML_VALIDATOR_ROOT}/Dockerfile .

.PHONY: html-validator-run
html-validator-run:
	docker run --rm --interactive --tty --volume=${ROOT}:/foo --workdir=/foo ${HTML_VALIDATOR_IMAGE}

.PHONY: html-validator-debug
html-validator-debug:
	docker run --rm --interactive --tty --volume=${ROOT}:/foo --workdir=/foo ${HTML_VALIDATOR_IMAGE} bash
