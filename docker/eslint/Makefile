SHELL := /usr/bin/env bash

JS_VALIDATOR_IMAGE := tedmiston/qcbrunch-eslint:latest

.PHONY: build-js-validator
build-js-validator:
	docker build --no-cache --tag=${JS_VALIDATOR_IMAGE} --file=docker/eslint/Dockerfile .

.PHONY: run-js-validator
run-js-validator:
	docker run --rm -it -v ${ROOT}:/usr/src/app --workdir=/usr/src/app ${JS_VALIDATOR_IMAGE}

.PHONY: debug-js-validator
debug-js-validator:
	docker run --rm -it -v ${ROOT}:/usr/src/app --workdir=/usr/src/app ${JS_VALIDATOR_IMAGE} sh
