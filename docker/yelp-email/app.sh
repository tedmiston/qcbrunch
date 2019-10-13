#!/usr/bin/env bash
set -Eeuo pipefail

REPO_COUNT=$(grep "subscribers:" data.yaml | sed -E 's/.*subscribers:\s*([[:digit:]]+)\s*/\1/')
echo REPO_COUNT=${REPO_COUNT}

YELP_COUNT=$(cat yelp_followers_count.txt)
echo YELP_COUNT=${YELP_COUNT}

if [ "$REPO_COUNT" == "$YELP_COUNT" ]
then
    echo counts are equal
    echo not sending email
    exit
else
    echo counts are not equal
    TIMESTAMP=$(date)
    MESSAGE_JSON='{
      "personalizations": [
        {
          "to": [
            {
              "email": "'"${EMAIL_RECIPIENT}"'"
            }
          ],
          "substitutions": {
            "-YELP_COUNT-": "'"$YELP_COUNT"'",
            "-REPO_COUNT-": "'"$REPO_COUNT"'",
            "-TIMESTAMP-": "'"$TIMESTAMP"'"
          }
        }
      ],
      "from": {
        "name": "QCBrunch Alerts",
        "email": "'"${EMAIL_SENDER}"'"
      },
      "subject": "QCBrunch Notification - Yelp Collection Stats Changed -TIMESTAMP-",
      "content": [
        {
          "type": "text/plain",
          "value": "The Yelp Collection stats have changed.\n\nREPO_COUNT=-REPO_COUNT-\n\nYELP_COUNT=-YELP_COUNT-\n\nhttps://github.com/tedmiston/qcbrunch/actions\n\nhttps://www.yelp.com/collection/Ntw8wQeFY35dpevGB-Et_A?sort_by=alpha"
        }
      ]
    }'
    echo ${MESSAGE_JSON} | http POST https://api.sendgrid.com/v3/mail/send Authorization:"Bearer ${SENDGRID_API_KEY}"
    echo email sent
fi
