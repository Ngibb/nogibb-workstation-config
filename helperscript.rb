# Install Puppet
# Have sudo
`cd /tmp`
`wget https://apt.puppetlabs.com/puppet5-release-stretch.deb`
`sudo dpkg -i puppet5-release-stretch.deb`
`sudo apt-get update`
`sudo apt-get install puppet`
`sudo apt-get install git`
`sudo puppet module install puppetlabs-apt`
`sudo puppet apply /home/ngibb/git/workstation-config/configure_me.pp -t --modulepath=/home/ngibb/git/workstation-config/puppet_code:/etc/puppet/code/modules`
