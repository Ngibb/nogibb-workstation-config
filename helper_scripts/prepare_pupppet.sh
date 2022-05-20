#!/bin/bash
# set -x
echo "Installing some pre-reqs"
sudo apt-get install -y curl wget git
echo ""






PUPPET_VERSION=7
DEBIAN_RELEASE=buster
PUPPET_APT_URL=https://apt.puppet.com
PUPPET_DOWNLOAD_URL=${PUPPET_APT_URL}/puppet${PUPPET_VERSION}-release-${DEBIAN_RELEASE}.deb
PUPPET_CURL_FILE_PATH=/tmp/puppet-release.deb
PUPPET_BINARY_PATH=/opt/puppetlabs/bin/puppet


echo "Install Puppet version ${PUPPET_VERSION} for ${DEBIAN_RELEASE} from $PUPPET_DOWNLOAD_URL"
curl -o $PUPPET_CURL_FILE_PATH $PUPPET_DOWNLOAD_URL
echo ""


# Create SSH Key
# Prompt upload of SSH Key
# Download the Git repo


echo "Install the puppet release package"
sudo dpkg -i $PUPPET_CURL_FILE_PATH
echo ""

echo "Run apt-get update"
sudo apt-get update
echo ""

echo "Install puppet-agent"
sudo apt-get install puppet-agent
echo ""

echo "Install required puppet module"
sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apt
echo ""

set -xe

# Create SSH Key
mkdir -p ~/.ssh
cd ~/.ssh
ssh-keygen -t ecdsa
cd ~
# Prompt upload of SSH Key
echo "Upload this ssh key"
cat ~/.ssh/id_ecdsa.pub
echo ""
echo "Add the key https://gitlab.com/-/profile/keys"
echo ""
echo "Press any key to continue"
read  -n 1 -s 
echo ""

# Download the Git repo
git clone git@gitlab.com:Ngibb/workstation-config.git
git clone git@gitlab.com:Ngibb/workstation-config-hiera.git

CONFIG_DIR_PATH="/home/ngibb/workstation-config"
echo "Run puppet"
echo "sudo $PUPPET_BINARY_PATH apply ${CONFIG_DIR_PATH}/configure_me.pp -t --noop --modulepath=${CONFIG_DIR_PATH}/puppet_code:/etc/puppetlabs/code/environments/production/modules"
echo ""
