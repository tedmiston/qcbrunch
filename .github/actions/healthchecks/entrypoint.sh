#!/bin/sh

set -euo pipefail

if [ $# -eq 0 ]; then
  echo 'Usage: <job status> <healthchecks url>'
  exit 1
fi

job_status=$(echo "${1}" | tr '[:upper:]' '[:lower:]')
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

curl --silent --show-error --output /dev/null --retry 3 "${url}"
echo 'success'
