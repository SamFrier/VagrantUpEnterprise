#!/usr/bin/env bash

sudo ufw disable
sudo apt-get update
sudo apt-get install -y openssh-server

# unpack installer
sudo cp /tmp/shared/puppet-enterprise-2015.2.0-ubuntu-14.04-amd64.tar.gz /opt/
cd /opt
sudo tar xzf puppet-enterprise-2015.2.0-ubuntu-14.04-amd64.tar.gz
sudo cp /tmp/shared/answers.txt /opt/puppet-enterprise-2015.2.0-ubuntu-14.04-amd64

# update verified packages
wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get update

# run installer
cd puppet-enterprise-2015.2.0-ubuntu-14.04-amd64
sudo ./puppet-enterprise-installer -a answers.txt