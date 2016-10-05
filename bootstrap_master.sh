#!/usr/bin/env bash

echo "Hello world"

sudo apt-get update

#Install Git
sudo apt-get install git

#Install Jira
cd /tmp/shared
chmod a+x jira.bin
./jira.bin -q -varfile response.varfile
