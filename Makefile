SHELL := /usr/bin/env bash

ROOT := $$(pwd)

REGISTRY_URL := docker.pkg.github.com
REGISTRY_USERNAME := tedmiston
REGISTRY_PREFIX := $(REGISTRY_URL)/$(REGISTRY_USERNAME)/qcbrunch

include docker/*/Makefile

.PHONY: install
install:
	npm install

.PHONY: run
run:
	cd qcbrunch-cli && qcbrunch dev run

.PHONY: tree
tree:
	tree -I node_modules

.PHONY: publish-image
publish-image:
	echo $(REGISTRY_TOKEN) | docker login --username=$(REGISTRY_USERNAME) --password-stdin $(REGISTRY_URL) && \
	docker push $(REGISTRY_PREFIX)/$(IMAGE) && \
	docker logout $(REGISTRY_URL)

.PHONY: deploy-dev
deploy-dev:
	cd build && \
	sudo vercel link --token=$(ZEIT_TOKEN) --confirm --project=qcbrunch-dev && \
	sudo vercel deploy --token=$(ZEIT_TOKEN) --confirm --prod

.PHONY: deploy-prod
deploy-prod:
	cd build && \
	sudo vercel link --token=$(ZEIT_TOKEN) --confirm --project=qcbrunch-prod && \
	sudo vercel deploy --token=$(ZEIT_TOKEN) --confirm --prod
