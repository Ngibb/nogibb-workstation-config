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

CONFIG_DIR_PATH=$(dirname $0)
echo "Run puppet"
echo "sudo $PUPPET_BINARY_PATH apply ${CONFIG_DIR_PATH}/configure_me.pp -t --noop --modulepath=${CONFIG_DIR_PATH}/puppet_code:/etc/puppetlabs/code/environments/production/modules"
echo ""
