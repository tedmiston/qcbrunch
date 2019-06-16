SHELL := /usr/bin/env bash

GOOGLE_MAPS_VIEWS_IMAGE := tedmiston/qcbrunch-google-maps-views:latest
GOOGLE_MAPS_VIEWS_ROOT := docker/google-maps-views

.PHONY: google-maps-views-build
google-maps-views-build:
	docker build --no-cache --tag=${GOOGLE_MAPS_VIEWS_IMAGE} --file=${GOOGLE_MAPS_VIEWS_ROOT}/Dockerfile .

.PHONY: google-maps-views-run
google-maps-views-run:
	docker run --rm --interactive --tty --volume=${ROOT}:/foo --workdir=/foo ${GOOGLE_MAPS_VIEWS_IMAGE}

.PHONY: google-maps-views-debug
google-maps-views-debug:
	docker run --rm --interactive --tty --volume=${ROOT}:/foo --workdir=/foo ${GOOGLE_MAPS_VIEWS_IMAGE} bash
