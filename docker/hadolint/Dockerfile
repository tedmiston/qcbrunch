FROM debian:stable-slim@sha256:6657ae6b0959f549b6fffd5328ba550bb8a8e6685d23e9f8b491fec3de9e8dd3

COPY --from=hadolint/hadolint /bin/hadolint /bin/hadolint

ENTRYPOINT find docker/ -name Dockerfile | xargs hadolint
