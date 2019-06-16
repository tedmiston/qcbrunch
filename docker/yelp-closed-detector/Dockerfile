FROM python:3.7-slim@sha256:589527a734f2a9e48b23cc4687848cb9503d0f8569fad68c3ad8b2ee9d1c50ff

COPY docker/yelp-closed-detector/requirements_frozen.txt docker/yelp-closed-detector/requirements_frozen.txt

RUN pip install -r docker/yelp-closed-detector/requirements_frozen.txt

CMD ["./docker/yelp-closed-detector/app.py"]
