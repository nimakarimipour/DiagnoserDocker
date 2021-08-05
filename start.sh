#!/bin/bash

# install dependencies locally
source /var/diagnoser/git.config

git config --global user.email "${EMAIL}"
git config --global user.name "${USERNAME}"
git config --global push.default simple
git config --global pull.rebase false



pushd /tmp/
git clone https://${USERNAME}:${KEY}@github.com/nimakarimipour/NullAway.git
pushd NullAway
git checkout autofix
./gradlew publishToMavenLocal
popd
popd


pushd /tmp/
git clone https://${USERNAME}:${KEY}@github.com/nimakarimipour/Diagnoser.git
pushd Diagnoser
git checkout batch
popd
popd

pushd /tmp/
git clone https://${USERNAME}:${KEY}@github.com/nimakarimipour/Docker_AE_NA.git
pushd Docker_AE_NA
python3 start.py ${USERNAME} ${KEY}
popd
popd