#!/bin/sh

set -euo pipefail

if [ $# -eq 0 ]; then
  echo 'Usage: <job status> <healthchecks url>'
  exit 1
fi

job_status=$(echo "${INPUT_STATUS}" | tr '[:upper:]' '[:lower:]')url="${2}"
url="${INPUT_URL}"
if [ "${job_status}" == 'success' ];
then
  curl --silent --show-error --output /dev/null --retry 3 "${url}"
elif [ "${job_status}" == 'failure' ];
then
  curl --silent --show-error --output /dev/null --retry 3 "${url}/fail"
elif [ "${job_status}" == 'cancelled' ];
then
  echo 'job cancelled'
else
  echo 'invalid job status'
  exit 1
fi

echo "logged ${job_status}"
