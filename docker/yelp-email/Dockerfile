FROM debian:stable-slim

RUN apt-get update && \
    apt-get --yes install httpie

CMD ["./docker/yelp-email/app.sh"]
