#!/bin/bash

sudo tar -zxvf maven.tar.gz
sudo update-alternatives --install /usr/bin/mvn mvn /usr/share/puppet/modules/maven/files/apache-maven-3.3.9/bin/mvn 100
