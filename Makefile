SHELL := /usr/bin/env bash

ROOT := $$(pwd)

include docker/google-maps-email/Makefile
include docker/google-maps-views/Makefile
include docker/html-validator/Makefile
include docker/js-validator/Makefile
include docker/yelp-email/Makefile

.PHONY: install
install:
	npm install

.PHONY: run
run:
	cd qcbrunch-cli && pipenv run qcbrunch dev run
