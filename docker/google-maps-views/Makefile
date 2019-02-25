SHELL := /usr/bin/env bash

GOOGLE_MAPS_VIEWS_IMAGE := tedmiston/qcbrunch-google-maps-views:latest
GOOGLE_MAPS_VIEWS_ROOT := docker/google-maps-views

.PHONY: build-google-maps-views
build-google-maps-views:
	docker build --no-cache --tag=${GOOGLE_MAPS_VIEWS_IMAGE} --file=${GOOGLE_MAPS_VIEWS_ROOT}/Dockerfile .

.PHONY: run-google-maps-views
run-google-maps-views:
	docker run --rm --interactive --tty --volume=${ROOT}:/foo --workdir=/foo ${GOOGLE_MAPS_VIEWS_IMAGE}

.PHONY: debug-google-maps-views
debug-google-maps-views:
	docker run --rm --interactive --tty --volume=${ROOT}:/foo --workdir=/foo ${GOOGLE_MAPS_VIEWS_IMAGE} bash
