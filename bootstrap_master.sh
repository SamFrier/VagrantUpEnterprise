#!/usr/bin/env bash

echo "Setting up Master"

sudo apt-get update

#Install puppet
sudo apt-get install -y puppet puppetmaster
#Edit the hosts file
echo "Editing hosts file..."
sed -i '1s/^/127.0.0.1	vumaster.qac.local	puppetmaster\n192.168.1.20	vumaster.qac.local	puppetmaster\n/' /etc/hosts

#Install Git
sudo apt-get -y install git

#Install Jira
cd /tmp/shared
chmod a+x jira.bin
./jira.bin -q -varfile response.varfile
