FROM debian:stable-slim@sha256:6657ae6b0959f549b6fffd5328ba550bb8a8e6685d23e9f8b491fec3de9e8dd3

RUN apt-get update && \
    apt-get --yes install httpie

CMD ["./docker/yelp-email/app.sh"]
