#!/bin/bash

echo "Setting up an agent"

sudo apt-get update
sudo apt-get install -y openssh-server openssh-client
sudo ufw disable

#Install puppet
sudo apt-get install -y puppet
#Edit the hosts file
ADDRESS=$(facter ipaddress_eth1)
NAME=$(facter fqdn)
sed -i "1s/^/$ADDRESS	$NAME	puppet\n/" /etc/hosts
sed -i "1s/^/127.0.0.1	$NAME	puppet\n/" /etc/hosts
sed -i "1s/^/192.168.1.20	vumaster.qac.local	puppetmaster\n/" /etc/hosts

#Edit the conf file
sed -i 's/ain]/ain]\nserver=vumaster.qac.local/g' /etc/puppet/puppet.conf

#Connect to the master
sudo puppet agent --test --server=vumaster.qac.local
sudo service puppet stop
sudo service puppet start
sudo puppet agent --enable
sudo puppet agent -t
