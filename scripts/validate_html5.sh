#!/bin/bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

set -euo pipefail

resp=$(curl --silent -H "Content-Type: text/html; charset=utf-8" --data-binary @index.html https://validator.w3.org/nu/?out=gnu)

if [ -z "$resp" ]; then
	exit 0
else
	exit 1
fi
