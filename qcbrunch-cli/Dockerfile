# FROM python:3.7.3-stretch
FROM ubuntu:18.04

# WORKDIR /github/workspace/

RUN pwd
RUN ls -al

RUN ls -al home

RUN cd qcbrunch-cli/ && pip install -e .

ENV QCBRUNCH_ROOT /github/workspace

RUN qcbrunch --help

# CMD qcbrunch --help
# CMD qcbrunch clean && qcbrunch render && qcbrunch build
