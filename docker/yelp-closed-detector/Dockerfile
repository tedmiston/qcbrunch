FROM python:3 AS base

RUN apt-get update && \
    apt-get --yes install \
        python3 \
        python3-pip

RUN pip3 install requests-html==0.10.0

FROM base as prod

FROM base AS dev
RUN pip3 install black

CMD ["./docker/yelp-closed-detector/app.py"]
