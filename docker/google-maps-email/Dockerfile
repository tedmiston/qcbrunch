FROM alpine:latest@sha256:28ef97b8686a0b5399129e9b763d5b7e5ff03576aa5580d6f4182a49c5fe1913

RUN apk update && \
    apk upgrade && \
    apk add \
        bash

CMD ["./docker/google-maps-email/app.sh"]
