SHELL := /usr/bin/env bash

ROOT := $$(pwd)

REGISTRY_URL := docker.pkg.github.com
REGISTRY_PREFIX := $(REGISTRY_URL)/tedmiston/qcbrunch

include docker/*/Makefile

.PHONY: install
install:
	npm install

.PHONY: run
run:
	cd qcbrunch-cli && pipenv run qcbrunch dev run

.PHONY: tree
tree:
	tree -I node_modules

.PHONY: format-jsonnet
format-jsonnet:
	echo .now.jsonnet .now.libsonnet | xargs --max-args=1 --verbose jsonnetfmt --in-place

.PHONY: publish-image
publish-image:
	echo $(REGISTRY_TOKEN) | docker login --username=tedmiston --password-stdin $(REGISTRY_URL) && \
	docker push $(REGISTRY_PREFIX)/$(IMAGE) && \
	docker logout $(REGISTRY_URL)
