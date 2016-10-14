#!/bin/bash

echo "Setting up an agent"

sudo apt-get update
sudo apt-get install -y openssh-server openssh-client
sudo apt-get install -y curl
sudo ufw disable

sudo chown -R vagrant /home/vagrant/.ssh
sudo chmod 0700 /home/vagrant/.ssh
sudo chmod 0600 /home/vagrant/.ssh/authorized_keys

#Install puppet
sudo apt-get install -y puppet

echo "Editing hosts file..."
#Edit the hosts file
sed -i "1s/^/192.168.1.20	entmaster.qac.local	entmaster\n/" /etc/hosts

#Edit the conf file
echo "Editing the puppet.conf file..."
sed -i 's/ain]/ain]\nserver=entmaster.qac.local/g' /etc/puppet/puppet.conf

#Connect to the master
echo "Managing communications with master client..."
#sudo curl -k https://entmaster.qac.local:8140/packages/current/install.bash | sudo bash
sudo puppet agent --test --server=entmaster.qac.local
sudo service puppet stop
sudo service puppet start
sudo puppet agent --enable
sudo puppet agent -t
