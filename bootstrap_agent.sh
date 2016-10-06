#!/usr/bin/env bash

echo "Hello world"
ADDRESS=$(facter ipaddress_eth1)
NAME=$(facter fqdn)

sudo apt-get update
sudo apt-get install -y openssh-server openssh-client
sudo ufw disable

#Install puppet
sudo apt-get install -y puppet
#Edit the hosts file
sed -i "1s/^/$ADDRESS	$NAME	puppet\n/" /etc/hosts
sed -i "1s/^/127.0.0.1	$NAME	puppet\n/" /etc/hosts
sed -i "1s/^/192.168.1.20	vumaster.qac.local	puppetmaster\n/" /etc/hosts

#Edit the conf file
sed -i 's/ain]/ain]\nserver=vumaster.qac.local/g' /etc/puppet/puppet.conf

# install git
sudo apt-get install -y git
