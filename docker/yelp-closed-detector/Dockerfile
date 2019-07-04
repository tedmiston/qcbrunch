FROM python:3@sha256:284a4057aac706aaafe50c5c0090d6d311f5d8d72014f0cd69f880a54e9df6fe AS base

RUN pip install \
    requests-html==0.10.0 \
    sendgrid==6.0.5

FROM base AS prod

CMD ["./docker/yelp-closed-detector/app.py"]

FROM prod AS dev
RUN pip install black