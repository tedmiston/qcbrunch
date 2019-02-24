SHELL := /usr/bin/env bash

ROOT := $$(pwd)

include docker/html-validator/Makefile
include docker/js-validator/Makefile
include docker/yelp-email/Makefile

.PHONY: run
run:
	serve
