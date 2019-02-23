SHELL := /usr/bin/env bash

ROOT := $$(pwd)

include docker/eslint/Makefile
include docker/validator/Makefile

.PHONY: run
run:
	serve
