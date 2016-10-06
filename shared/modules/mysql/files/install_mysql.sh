#!/usr/bin/env bash

cd /opt/
sudo tar xvf mysql.tar
sudo dpkg-preconfigure mysql-community-server_*.deb # might need to automate user input here!!!
sudo dpkg -i mysql-{common,community-client,client,community-server,server}_*.deb
sudo apt-get -f install -y
sudo dpkg -i mysql-{common,community-client,client,community-server,server}_*.de
b # likewise
