FROM python:3.7.4@sha256:dbae83460610c9bbe344e9f21fb353395a641349c2b10fdb2e2472bed9625b77 AS base

RUN pip install --upgrade pip

RUN pip install \
    requests-html==0.10.0 \
    sendgrid==6.0.5

FROM base AS prod

CMD ["./docker/yelp-closed-detector/app.py"]

FROM prod AS dev
RUN pip install black
