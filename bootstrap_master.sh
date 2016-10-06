#!/usr/bin/env bash

SITE='/etc/puppet/manifests'
echo "Setting up Master"

sudo apt-get update
sudo apt-get install -y openssh-server openssh-client
sudo ufw disable

#Install puppet
sudo apt-get install -y puppet puppetmaster
#Edit the hosts file
echo "Editing hosts file..."
sed -i '1s/^/127.0.0.1	vumaster.qac.local	puppetmaster\n192.168.1.20	vumaster.qac.local	puppetmaster\n/' /etc/hosts

#Add to site.pp
echo "node 'vuagent1.qac.local', 'vuagent2.qac.local', 'vuagent3.qac.local' {">>$SITE/site.pp
echo "	include java">>$SITE/site.pp
echo "	include maven">>$SITE/site.pp
echo "	include git">>$SITE/site.pp
echo "	include jira">>$SITE/site.pp
echo "	include nexus">>$SITE/site.pp
echo "	include bamboo">>$SITE/site.pp
echo "	include sql">>$SITE/site.pp
echo "}">>$SITE/site.pp

#Install Git
sudo apt-get -y install git

#Install Jira
cd /tmp/shared
chmod a+x jira.bin
./jira.bin -q -varfile response.varfile
