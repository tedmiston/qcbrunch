FROM alpine:3.10.3@sha256:c19173c5ada610a5989151111163d28a67368362762534d8a8121ce95cf2bd5a

RUN apk add --quiet curl
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
