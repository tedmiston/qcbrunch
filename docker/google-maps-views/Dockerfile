FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add \
        bash \
        curl

CMD ["./docker/google-maps-views/app.sh"]
