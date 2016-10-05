#!/usr/bin/env bash

echo "Hello world"

sudo apt-get update

sudo apt-get install -y puppet puppetmaster

#Install Git
sudo apt-get -y install git

#Install Jira
cd /tmp/shared
chmod a+x jira.bin
./jira.bin -q -varfile response.varfile
