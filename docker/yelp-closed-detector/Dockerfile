FROM python:3@sha256:284a4057aac706aaafe50c5c0090d6d311f5d8d72014f0cd69f880a54e9df6fe AS base

RUN apt-get update && \
    apt-get --yes install \
        python3 \
        python3-pip

RUN pip3 install requests-html==0.10.0

FROM base as prod

FROM base AS dev
RUN pip3 install black

CMD ["./docker/yelp-closed-detector/app.py"]
