#!/bin/bash
# Set up the Puppet Master

vagrant ssh puppet -c "sudo wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb; \
sudo dpkg -i puppetlabs-release-trusty.deb; \
sudo apt-get update; \
sudo apt-get  install -y puppetmaster; \
sudo rmdir /etc/puppet/modules || sudo unlink /etc/puppet/modules; \
sudo ln -s /vagrant/modules /etc/puppet/modules; \
sudo ln -s /vagrant/site.pp /etc/puppet/manifests/site.pp; \
sudo service puppetmaster restart;\
sudo puppet agent -t;"
# sudo puppet apply --modulepath /etc/puppet/modules -e \"class { '::puppetdb': listen_address => '0.0.0.0', ssl_listen_address => '0.0.0.0' } class { 'puppetdb::master::config': puppetdb_server => 'puppet'}\""
