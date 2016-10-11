#!/usr/bin/env bash

echo "Plums"

sudo ufw disable
sudo apt-get update
sudo apt-get install -y openssh-server
sudo apt-get install -y curl

# install puppet
sudo apt-get install -y puppet

# update verified packages
wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get update

# update hosts
ADDRESS=$(facter ipaddress_eth1)
NAME=$(facter fqdn)
sed -i "1s/^/$ADDRESS	$NAME	puppet\n/" /etc/hosts
sed -i "1s/^/127.0.0.1	$NAME	puppet\n/" /etc/hosts
sed -i "1s/^/192.168.1.42	enterprisemaster.qac.local	puppetmaster\n/" /etc/hosts
sed -i 's/[main]/[main]\nserver=enterprisemaster.qac.local/g' /etc/puppet/puppet.conf

# connect to master
curl -k https://192.168.1.42:8140/packages/current/install.bash | sudo bash
# need to sign certificates manually!