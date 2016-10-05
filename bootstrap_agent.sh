#!/usr/bin/env bash

echo "Hello world"

sudo apt-get update

# install git
sudo apt-get install -y git

cd /tmp/shared
chmod a+x jira.bin
./jira.bin -q -varfile response.varfile
