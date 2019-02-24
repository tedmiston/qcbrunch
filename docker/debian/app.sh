#!/usr/bin/env bash
set -e

REPO_COUNT=$(grep "id=\"yelp-collection-followers\"" index.html | sed -E 's/.*data-yelp-collection-followers-count="([[:digit:]]+)".*/\1/')
echo REPO_COUNT=${REPO_COUNT}

YELP_COUNT=$(cat yelp_followers_count.txt)
echo YELP_COUNT=${YELP_COUNT}

if [ "$REPO_COUNT" == "$YELP_COUNT" ]
then
    echo counts are equal
    exit 78
else
    echo counts are not equal
    YELP_COUNT=1000
    REPO_COUNT=1001
    GITHUB_RUN_URL=https://github.com/tedmiston/qcbrunch/runs/67864001
    TIMESTAMP=$(date)
    MESSAGE_JSON='{
      "personalizations": [
        {
          "to": [
            {
              "email": "tedmiston@gmail.com"
            }
          ],
          "substitutions": {
            "-YELP_COUNT-": "'"$YELP_COUNT"'",
            "-REPO_COUNT-": "'"$REPO_COUNT"'",
            "-GITHUB_RUN_URL-": "'"$GITHUB_RUN_URL"'",
            "-TIMESTAMP-": "'"$TIMESTAMP"'"
          }
        }
      ],
      "from": {
        "name": "QCBrunch Alerts",
        "email": "no-reply@qcbrunch.com"
      },
      "subject": "QCBrunch SendGrid test -TIMESTAMP-",
      "content": [
        {
          "type": "text/plain",
          "value": "Do not panic — this is just a test!!!\n\nREPO_COUNT=-REPO_COUNT-\n\nYELP_COUNT=-YELP_COUNT-\n\n-GITHUB_RUN_URL-"
        }
      ]
    }'
    echo ${MESSAGE_JSON} | http POST https://api.sendgrid.com/v3/mail/send Authorization:"Bearer ${SENDGRID_API_KEY}"
fi