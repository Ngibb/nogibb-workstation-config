# Install Puppet
# Have sudo
`cd /tmp`
`wget https://apt.puppetlabs.com/puppet5-release-stretch.deb`
`sudo dpkg -i puppet5-release-stretch.deb`
`sudo apt-get update`
`sudo apt-get install puppet`
`sudo puppet module puppetlabs-apt`
`sudo apt-get install git`


`sudo mkdir /etc/puppet/code/modules`
# symlink into puppet dir 
`sudo ln -s /home/ngibb/git/workstation-config/puppet_code/desktop_confi/ /etc/puppet/code/modules/desktop_config`
