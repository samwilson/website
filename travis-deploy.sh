#!/bin/bash

## Install latest Pandoc.
wget https://github.com/jgm/pandoc/releases/download/1.17.0.2/pandoc-1.17.0.2-1-amd64.deb
sudo dpkg -i pandoc-1.17.0.2-1-amd64.deb
rm pandoc-1.17.0.2-1-amd64.deb

## Build the site, then commit the built files to the master branch.
build.sh
cd public
git init
git config user.name "Travis CI"
git config user.email "sam@samwilson.id.au"
git add -A \*.html \*.pdf \*.css CNAME
git commit -m"Files built by Travis."

## Push the changes back to Github.
git push -f "https://${GH_TOKEN}@github.com/samwilson/samwilson.github.io.git" master:master
