SHELL := /usr/bin/env bash

HTML_VALIDATOR_IMAGE := validator/validator:latest

.PHONY: build-html-validator
build-html-validator:
	docker build --no-cache --tag=${HTML_VALIDATOR_IMAGE} --file=docker/validator/Dockerfile .

.PHONY: run-html-validator
run-html-validator:
	docker run --rm -it -v ${ROOT}:/foo --workdir=/foo ${HTML_VALIDATOR_IMAGE}

.PHONY: debug-html-validator
debug-html-validator:
	docker run --rm -it -v ${ROOT}:/foo --workdir=/foo ${HTML_VALIDATOR_IMAGE} sh
