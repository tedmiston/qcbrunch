SHELL := /usr/bin/env bash

YELP_CLOSED_DETECTOR_IMAGE := tedmiston/qcbrunch-yelp-closed-detector:latest
YELP_CLOSED_DETECTOR_ROOT := docker/yelp-closed-detector

.PHONY: yelp-closed-detector-build-prod
yelp-closed-detector-build-prod:
	docker build --target=prod --no-cache --tag=${YELP_CLOSED_DETECTOR_IMAGE} --file=${YELP_CLOSED_DETECTOR_ROOT}/Dockerfile .

.PHONY: yelp-closed-detector-build-dev
yelp-closed-detector-build-dev:
	docker build --target=dev --tag=${YELP_CLOSED_DETECTOR_IMAGE}-dev --file=${YELP_CLOSED_DETECTOR_ROOT}/Dockerfile .

.PHONY: yelp-closed-detector-build
yelp-closed-detector-build: yelp-closed-detector-build-prod yelp-closed-detector-build-dev

.PHONY: yelp-closed-detector-run
yelp-closed-detector-run:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_CLOSED_DETECTOR_IMAGE}

.PHONY: yelp-closed-detector-debug
yelp-closed-detector-debug:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_CLOSED_DETECTOR_IMAGE}-dev bash

.PHONY: yelp-closed-detector-lint
yelp-closed-detector-lint:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_CLOSED_DETECTOR_IMAGE}-dev black --diff docker/yelp-closed-detector/*.py

.PHONY: yelp-closed-detector-format
yelp-closed-detector-format:
	docker run --rm --interactive --tty --env-file=.env --volume=${ROOT}:/foo --workdir=/foo ${YELP_CLOSED_DETECTOR_IMAGE}-dev black docker/yelp-closed-detector/*.py

.PHONY: yelp-closed-detector-trigger
yelp-closed-detector-trigger:
	http --auth="tedmiston:${GITHUB_TOKEN}" POST \
	https://api.github.com/repos/tedmiston/qcbrunch/dispatches \
	Accept:application/vnd.github.everest-preview+json \
	X-API-Token:tedmiston:${GITHUB_TOKEN} \
	event_type=yelp_closed_detector
