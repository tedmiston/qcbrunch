FROM python:3.8.2@sha256:67243d9d9dc8c93087c53a1cbde644b461bf412891283d06ec77425db11319d1 AS base

RUN pip install --upgrade pip

RUN pip install \
    requests-html==0.10.0 \
    sendgrid==6.0.5

FROM base AS prod

CMD ["./docker/yelp-closed-detector/app.py"]

FROM prod AS dev
RUN pip install black
