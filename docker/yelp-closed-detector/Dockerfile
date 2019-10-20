FROM python:3.8.0@sha256:514a95a32b86cafafefcecc28673bb647d44c5aadf06203d39c43b9c3f61ed52 AS base

RUN pip install --upgrade pip

RUN pip install \
    requests-html==0.10.0 \
    sendgrid==6.0.5

FROM base AS prod

CMD ["./docker/yelp-closed-detector/app.py"]

FROM prod AS dev
RUN pip install black
