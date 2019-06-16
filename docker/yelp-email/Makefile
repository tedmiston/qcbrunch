SHELL := /usr/bin/env bash

YELP_EMAIL_IMAGE := tedmiston/qcbrunch-yelp-email:latest
YELP_EMAIL_ROOT := docker/yelp-email

.PHONY: build-yelp-email
build-yelp-email:
	docker build --no-cache --tag=${YELP_EMAIL_IMAGE} --file=${YELP_EMAIL_ROOT}/Dockerfile .

.PHONY: run-yelp-email
run-yelp-email:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_EMAIL_IMAGE}

.PHONY: debug-yelp-email
debug-yelp-email:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_EMAIL_IMAGE} bash
