#!/usr/bin/env bash

ARGOSSOURCEPATH=$HOME/libzmq
ARGOSBUNDLEPATH=$HOME/argos3bundle

# Get latest ARGoS3-KheperaIV sources
if [[ ! -e $ARGOSSOURCEPATH ]]; then
    git clone https://github.com/zeromq/libzmq.git
fi

cd $ARGOSSOURCEPATH
git stash save
git pull
git stash pop

# Compile and install
./autogen.sh
./configure --disable-dependency-tracking --prefix=$ARGOSBUNDLEPATH
make install
