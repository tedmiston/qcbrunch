SHELL := /usr/bin/env bash

YELP_CLOSED_DETECTOR_IMAGE := tedmiston/qcbrunch-yelp-closed-detector:latest
YELP_CLOSED_DETECTOR_ROOT := docker/yelp-closed-detector

.PHONY: yelp-closed-detector-build
yelp-closed-detector-build:
	docker build --no-cache --tag=${YELP_CLOSED_DETECTOR_IMAGE} --file=${YELP_CLOSED_DETECTOR_ROOT}/Dockerfile .

.PHONY: yelp-closed-detector-run
yelp-closed-detector-run:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_CLOSED_DETECTOR_IMAGE}

.PHONY: yelp-closed-detector-debug
yelp-closed-detector-debug:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_CLOSED_DETECTOR_IMAGE} bash
