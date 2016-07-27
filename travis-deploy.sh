#!/bin/bash

## Install latest Pandoc.
PANDOC_DEB=pandoc-1.17.2-1-amd64.deb
wget https://github.com/jgm/pandoc/releases/download/1.17.2/$PANDOC_DEB
sudo dpkg -i $PANDOC_DEB
rm $PANDOC_DEB

## Build the site, then commit the built files to the master branch.
$TRAVIS_BUILD_DIR/build.sh
cd $TRAVIS_BUILD_DIR/public
git init
git config user.name "Travis CI"
git config user.email "sam@samwilson.id.au"
git add -A \*.html \*.pdf \*.css CNAME
git commit -m"Files built by Travis."

## Push the changes back to Github.
git push -f "https://${GH_TOKEN}@github.com/samwilson/samwilson.github.io.git" master:master
