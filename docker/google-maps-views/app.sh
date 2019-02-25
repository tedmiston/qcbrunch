#!/usr/bin/env bash
set -Eeuo pipefail

MAP_URL='https://www.google.com/maps/d/viewer?mid=1q1ikNFAU1WKUtkeGjK2mTaq6dvo&usp=sharing'
OUTPUT_FILE='out.html'

curl --silent --output ${OUTPUT_FILE} ${MAP_URL}
VIEW_COUNT=$(cat ${OUTPUT_FILE} | grep _pageData | sed -E 's/.*,([[:digit:]]{4,}).*,true,true.*/\1/')
echo ${VIEW_COUNT} views
echo ${VIEW_COUNT} > google_maps_views.txt
cat google_maps_views.txt
