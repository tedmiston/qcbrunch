SHELL := /usr/bin/env bash

ROOT := $$(pwd)

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
