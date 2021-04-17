#!/bin/bash

# install dependencies locally
source /var/diagnoser/git.config

git config --global user.email "${EMAIL}"
git config --global user.name "${USERNAME}"
git config --global push.default simple
git config --global pull.rebase false


if [ mvn dependency:get -Dartifact=edu.ucr.cs.riple:nullaway:0.7.12-SNAPSHOT -o -DrepoUrl=file://~/.m2/repository ]; then
    :
else
    pushd /tmp/
    git clone https://${USERNAME}:${KEY}@github.com/nimakarimipour/NullAway.git
    pushd NullAway
    git checkout autofix

    ./gradlew installArchives
    
    popd
    popd
fi


pushd /tmp/
git clone https://${USERNAME}:${KEY}@github.com/nimakarimipour/Diagnoser.git
popd

pushd /tmp/
git clone https://${USERNAME}:${KEY}@github.com/nimakarimipour/Docker_AE_NA.git
pushd Docker_AE_NA
python3 start.py ${USERNAME} ${KEY}
popd
popd