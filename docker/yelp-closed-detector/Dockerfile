# FROM python:3.7-slim@sha256:589527a734f2a9e48b23cc4687848cb9503d0f8569fad68c3ad8b2ee9d1c50ff AS base
# FROM debian:stable-slim@sha256:6657ae6b0959f549b6fffd5328ba550bb8a8e6685d23e9f8b491fec3de9e8dd3 AS base
# FROM python:3.6 AS base
# FROM jfloff/alpine-python:3.7 AS base
FROM debian:latest AS base

# RUN echo bust cache
RUN apt-get update && \
    apt-get --yes install \
        python3 \
        python3-pip

# RUN apk update
# RUN apk add --update --no-cache g++ gcc libxml2-dev libxslt-dev py-lxml
# RUN pip install --upgrade pip

RUN pip3 install requests-html==0.10.0

FROM base as prod
# RUN pwd
# RUN ls -al
# RUN ls -al $HOME
# RUN ls -al $GITHUB_WORKSPACE
# COPY docker/yelp-closed-detector/requirements_frozen.txt docker/yelp-closed-detector/requirements_frozen.txt
# RUN pip3 install -r docker/yelp-closed-detector/requirements_frozen.txt

FROM base AS dev
# COPY docker/yelp-closed-detector/requirements.txt docker/yelp-closed-detector/requirements.txt
# COPY docker/yelp-closed-detector/requirements_dev.txt docker/yelp-closed-detector/requirements_dev.txt
# RUN pip3 install -r docker/yelp-closed-detector/requirements_dev.txt
RUN pip3 install black

CMD ["./docker/yelp-closed-detector/app.py"]
