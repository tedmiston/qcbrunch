SHELL := /usr/bin/env bash

ROOT := $$(pwd)

include docker/debian/Makefile
include docker/eslint/Makefile
include docker/validator/Makefile

.PHONY: run
run:
	serve
