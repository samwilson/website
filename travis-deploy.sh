#!/bin/bash

build.sh
git config user.name "Travis CI"
git config user.email "sam@samwilson.id.au"
git add -A
git commit -m"Files built by Travis."
git push "https://${GH_TOKEN}@github.com/samwilson/samwilson.github.io.git" master:master
