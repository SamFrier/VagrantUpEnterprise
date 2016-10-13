#!/usr/bin/env bash

echo "Setting up Master"

shared='/tmp/shared'

sudo cp $shared/jira.bin $shared/modules/jira/files
sudo cp $shared/java.tar.gz $shared/modules/java/files
sudo cp $shared/jenkins_2.1_all.deb $shared/modules/jenkins/files
sudo cp $shared/mysql-server_5.7.15-1ubuntu14.04_amd64.deb-bundle.tar $shared/modules/mysql/files
sudo cp $shared/nexus-3.0.2-02-unix.tar.gz $shared/modules/nexus/files
sudo cp $shared/maven.tar.gz $shared/modules/maven/files
sudo cp $shared/atlassian-bamboo-5.13.2.tar.gz $shared/modules/bamboo/files
sudo cp $shared/zabbix-3.2.1.tar.gz $shared/modules/zabbix/files

sudo apt-get -y update
sudo apt-get install -y openssh-server openssh-client
sudo ufw disable

wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get -y update

sudo chown -R vagrant /home/vagrant/.ssh
sudo chmod 0700 /home/vagrant/.ssh
sudo chmod 0600 /home/vagrant/.ssh/authorized_keys

#Edit the hosts and conf files
echo "Editing hosts file..."
sed -i '1s/^/127.0.0.1	entmaster.qac.local	entmaster\n192.168.1.108	entmaster.qac.local	entmaster\n/' /etc/hosts

echo "Editing hosts file..."
#Edit the hosts file
sed -i "1s/^/192.168.1.108	entmaster.qac.local	entmaster\n/" /etc/hosts

sudo cp /tmp/shared/puppet-enterprise-2015.2.0-ubuntu-14.04-amd64.tar.gz /opt

cd /opt
sudo tar -zxvf /opt/puppet-enterprise-2015.2.0-ubuntu-14.04-amd64.tar.gz
sudo /opt/puppet-enterprise-2015.2.0-ubuntu-14.04-amd64/puppet-enterprise-installer -a /tmp/shared/answers.install

#Copy over the necessary modules
sudo cp -r /tmp/shared/modules /etc/puppetlabs/code/environments/production
sudo cp /tmp/shared/installZabbixServer.sh /opt/installZabbixServer.sh
sudo cp /tmp/shared/zabbix-3.2.1.tar.gz /opt/zabbix-3.2.1.tar.gz

#Edit the conf file
echo "Editing the puppet.conf file..."
sed -i 's/ain]/ain]\nserver=entmaster.qac.local/g' /etc/puppetlabs/puppet/puppet.conf

sudo ./installZabbixServer.sh
