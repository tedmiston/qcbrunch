SHELL := /usr/bin/env bash

YELP_EMAIL_IMAGE := tedmiston/qcbrunch-yelp-email:latest
YELP_EMAIL_ROOT := docker/yelp-email

.PHONY: yelp-email-build
yelp-email-build:
	docker build --no-cache --tag=${YELP_EMAIL_IMAGE} --file=${YELP_EMAIL_ROOT}/Dockerfile .

.PHONY: yelp-email-run
yelp-email-run:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_EMAIL_IMAGE}

.PHONY: yelp-email-debug
yelp-email-debug:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_EMAIL_IMAGE} bash
