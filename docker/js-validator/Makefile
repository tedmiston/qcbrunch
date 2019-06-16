SHELL := /usr/bin/env bash

JS_VALIDATOR_IMAGE := tedmiston/qcbrunch-js-validator:latest
JS_VALIDATOR_ROOT := docker/js-validator

.PHONY: build-js-validator
build-js-validator:
	docker build --no-cache --tag=${JS_VALIDATOR_IMAGE} --file=${JS_VALIDATOR_ROOT}/Dockerfile .

.PHONY: run-js-validator
run-js-validator:
	docker run --rm --interactive --tty --volume=${ROOT}:/usr/src/app --workdir=/usr/src/app ${JS_VALIDATOR_IMAGE}

.PHONY: debug-js-validator
debug-js-validator:
	docker run --rm --interactive --tty --volume=${ROOT}:/usr/src/app --workdir=/usr/src/app ${JS_VALIDATOR_IMAGE} bash
