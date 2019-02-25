FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add \
        bash

CMD ["./docker/google-maps-email/app.sh"]
