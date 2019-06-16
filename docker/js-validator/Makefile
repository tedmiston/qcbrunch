SHELL := /usr/bin/env bash

JS_VALIDATOR_IMAGE := tedmiston/qcbrunch-js-validator:latest
JS_VALIDATOR_ROOT := docker/js-validator

.PHONY: js-validator-build
js-validator-build:
	docker build --no-cache --tag=${JS_VALIDATOR_IMAGE} --file=${JS_VALIDATOR_ROOT}/Dockerfile .

.PHONY: js-validator-run
js-validator-run:
	docker run --rm --interactive --tty --volume=${ROOT}:/usr/src/app --workdir=/usr/src/app ${JS_VALIDATOR_IMAGE}

.PHONY: js-validator-debug
js-validator-debug:
	docker run --rm --interactive --tty --volume=${ROOT}:/usr/src/app --workdir=/usr/src/app ${JS_VALIDATOR_IMAGE} bash
