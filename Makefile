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
	cd qcbrunch-cli && pipenv run qcbrunch dev run

.PHONY: tree
tree:
	tree -I node_modules

.PHONY: format-jsonnet
format-jsonnet:
	echo .vercel.jsonnet .vercel.libsonnet | xargs --max-args=1 --verbose jsonnetfmt --in-place

.PHONY: publish-image
publish-image:
	echo $(REGISTRY_TOKEN) | docker login --username=$(REGISTRY_USERNAME) --password-stdin $(REGISTRY_URL) && \
	docker push $(REGISTRY_PREFIX)/$(IMAGE) && \
	docker logout $(REGISTRY_URL)

.PHONY: deploy-dev
deploy-dev:
	# cd build && sudo vercel deploy --confirm --prod --token=$(ZEIT_TOKEN) --local-config=.vercel/vercel.dev.json
	cd build && \
	sudo vercel link --confirm --token=$(ZEIT_TOKEN) --project=qcbrunch-dev && \
	sudo vercel deploy --confirm --prod

.PHONY: deploy-prod
deploy-prod:
	cd build && sudo vercel deploy --confirm --prod --token=$(ZEIT_TOKEN) --local-config=.vercel/vercel.prod.json
