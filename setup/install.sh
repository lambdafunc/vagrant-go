#!/bin/bash
# This is the entry point for configuring the system.
#####################################################

#install basic tools
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" install git

#get golang 1.9.1
wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz

#unzip the archive 
tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin
go version
#delete the source file
rm  go1.15.6.linux-amd64.tar.gz

#only full path will work
touch /home/vagrant/.bash_profile

echo "export PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bash_profile

echo `export GOPATH=/home/vagrant/workspace:$PATH` >> /home/vagrant/.bash_profile

export GOPATH=/home/vagrant/workspace

mkdir -p "$GOPATH/bin" 
