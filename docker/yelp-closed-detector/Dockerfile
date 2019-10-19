FROM python:3.8.0 AS base

RUN pip install --upgrade pip

RUN pip install \
    requests-html==0.10.0 \
    sendgrid==6.0.5

FROM base AS prod

CMD ["./docker/yelp-closed-detector/app.py"]

FROM prod AS dev
RUN pip install black
