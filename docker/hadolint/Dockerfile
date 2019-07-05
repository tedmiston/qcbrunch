FROM debian:9-slim@sha256:9490c476443a3869e39c2897fa66c91daf5dcbbfca53c976dac7bbdc45775b28

COPY --from=hadolint/hadolint:v1.17.1@sha256:567dd3eb729d76abe14d315bb5e9133ad587db7acd910e1c55d8d5d57bea4a8f /bin/hadolint /bin/hadolint

ENTRYPOINT find docker/ -name Dockerfile | xargs hadolint
