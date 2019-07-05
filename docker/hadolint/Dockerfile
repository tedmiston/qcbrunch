FROM debian:stable-slim@sha256:6657ae6b0959f549b6fffd5328ba550bb8a8e6685d23e9f8b491fec3de9e8dd3

COPY --from=hadolint/hadolint:v1.17.1@sha256:567dd3eb729d76abe14d315bb5e9133ad587db7acd910e1c55d8d5d57bea4a8f /bin/hadolint /bin/hadolint

ENTRYPOINT find docker/ -name Dockerfile | xargs hadolint
