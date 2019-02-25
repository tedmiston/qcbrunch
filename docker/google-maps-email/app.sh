#!/usr/bin/env bash
set -Eeuo pipefail

# TODO: REPO_COUNT check

GOOGLE_MAPS_COUNT=$(cat google_maps_views.txt)
echo GOOGLE_MAPS_COUNT=${GOOGLE_MAPS_COUNT}

# TODO: email on diff
