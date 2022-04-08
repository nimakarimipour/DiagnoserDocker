#!/bin/bash

# install dependencies locally
source /var/diagnoser/git.config

git config --global user.email "${EMAIL}"
git config --global user.name "${USERNAME}"
git config --global push.default simple
git config --global pull.rebase false



pushd /tmp/
mkdir NullAwayFix
git clone https://${USERNAME}:${KEY}@github.com/nimakarimipour/NullAwayAnnotator.git
popd