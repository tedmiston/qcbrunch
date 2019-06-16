SHELL := /usr/bin/env bash

GOOGLE_MAPS_EMAIL_IMAGE := tedmiston/qcbrunch-google-maps-email:latest
GOOGLE_MAPS_EMAIL_ROOT := docker/google-maps-email

.PHONY: google-maps-email-build
google-maps-email-build:
	docker build --no-cache --tag=${GOOGLE_MAPS_EMAIL_IMAGE} --file=${GOOGLE_MAPS_EMAIL_ROOT}/Dockerfile .

.PHONY: google-maps-email-run
google-maps-email-run:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${GOOGLE_MAPS_EMAIL_IMAGE}

.PHONY: google-maps-email-debug
google-maps-email-debug:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${GOOGLE_MAPS_EMAIL_IMAGE} bash
