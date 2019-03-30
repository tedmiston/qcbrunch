SHELL := /usr/bin/env bash

ROOT := $$(pwd)

include docker/html-validator/Makefile
include docker/google-maps-email/Makefile
include docker/google-maps-views/Makefile
include docker/js-validator/Makefile
include docker/yelp-email/Makefile

.PHONY: install
install:
	npm install

.PHONY: lint
lint:
	npm run lint

.PHONY: run
run:
	serve

.PHONY: deploy
deploy:
	now

.PHONY: deploy-staging
deploy-staging:
	now --target staging

.PHONY: deploy-prod
deploy-prod:
	now --target production
