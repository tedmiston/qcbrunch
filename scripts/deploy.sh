#!/bin/bash

# Based on CircleCI docs [1][2]. Somewhat inspired by [3], but simplified.
# [1]: https://circleci.com/docs/1.0/configuration/#deployment
# [2]: https://circleci.com/docs/1.0/adding-read-write-deployment-key/
# [3]: https://github.com/DevProgress/onboarding/wiki/Using-Circle-CI-with-Github-Pages-for-Continuous-Delivery

set -e

git config --global user.name "$GITHUB_NAME"
git config --global user.email "$GITHUB_EMAIL"

# reset build dir as circle caches files across builds
rm -fR build/
mkdir build
cd build/

# fast forward master --> gh-pages
git clone git@github.com:tedmiston/qcbrunch.git .
git checkout gh-pages
git merge --ff-only --quiet master

# push (trigger github pages deploy)
git push

# cleanup
cd ..
rm -fR build/

echo "Deployed! 🙌"
