SHELL := /usr/bin/env bash

HTML_VALIDATOR_IMAGE := tedmiston/qcbrunch-html-validator:latest
HTML_VALIDATOR_ROOT := docker/html-validator

.PHONY: build-html-validator
build-html-validator:
	docker build --no-cache --tag=${HTML_VALIDATOR_IMAGE} --file=${HTML_VALIDATOR_ROOT}/Dockerfile .

.PHONY: run-html-validator
run-html-validator:
	docker run --rm --interactive --tty --volume=${ROOT}:/foo --workdir=/foo ${HTML_VALIDATOR_IMAGE}

.PHONY: debug-html-validator
debug-html-validator:
	docker run --rm --interactive --tty --volume=${ROOT}:/foo --workdir=/foo ${HTML_VALIDATOR_IMAGE} bash
