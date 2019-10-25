#!/bin/sh

set -euo pipefail

if [ $# -eq 0 ]; then
  echo 'Usage: <job status> <healthchecks url>'
  exit 1
fi

job_status="${1}" | tr '[:upper:]' '[:lower:]'
url="${2}"

if [ "${job_status}" == 'success' ];
then
  url="${url}"
elif [ "${job_status}" == 'failure' ];
then
  url="${url}"/fail
elif [ "${job_status}" == 'cancelled' ];
then
  echo 'job cancelled'
  exit 1
else
  echo 'invalid job status'
  exit 1
fi

echo curl --retry 3 "${url}"
