# Configure my computer!

# Vars
# User who this is being configed for
$config_user = 'ngibb'
$config_user_home_dir = "/home/${config_user}"
$zshrc_dir = "${config_user_home_dir}/.zshrc.d"
$bashrc_dir = "${config_user_home_dir}/.bashrc.d"
# where this git repo lives
$workstation_config_dir = "/home/${config_user}/git/workstation-config"
# puppet code from the git repo, there will be link from /etc/puppet dir
$desktop_config_dir = "${workstation_config_dir}/puppet_code/desktop_config"
# puppet module proper directory
$puppet_code_dir = "/etc/puppet/code/modules/"

# Using the hostname to ID what kind of computer this is
$host_type = $facts['hostname'] ? {
  'cuiaba'	     => 'workstation',
  'campo-grande' => 'homestation',
  'fatima'       => 'laptop',
  'default'      => '', 
}

# default behavior for the file file type
File {
  backup => ".backup",
  owner => $config_user,
  group => $config_user,
  show_diff => true,
}

$wanted_packages = [
	'aptitude',
	'zsh',
	'keepass2',
	'keepassx',
	'dnsutils',
	'geoip-bin',
	'libfdisk1',
	'gcc',
	'gdb',
	'cgdb',
	'mlocate',
	'dos2unix',
  'openconnect',
	'mtr',
	'strace',
	'wireshark',
	'nmap',
	'iperf',
	'deluge',
	'iotop',
	'curl',
	'vlc',
	'whois',
	'cryptsetup',
	'netdiag',
	'rsync',
	'imagemagick',
	'jq',
	'ddd', # debugger
	'libreoffice',
	'yubioath-desktop',
	'unzip',
	'multitail',
  'bless', # hex editor
  'htop',
  'packer', # aws image creation 
]

# Packages we want / are useful
$wanted_packages.each |String $my_package|{
	package { $my_package:
		ensure => installed 
	}
}

user{ $config_user:
  ensure => present,
  shell => "/usr/bin/zsh",
  require => "Package[zsh]",
}

include desktop_config::meta
include "desktop_config::${host_type}"
include desktop_config::motd

include desktop_config::zsh_setup
include desktop_config::bash_setup
include desktop_config::emoji_support
include desktop_config::gnome_settings

include desktop_config::apps::terraform
include desktop_config::apps::okta_aws_cli
include desktop_config::apps::spotify
include desktop_config::apps::slack
include desktop_config::apps::irssi
include desktop_config::apps::terminator
include desktop_config::apps::vim
include desktop_config::apps::git
include desktop_config::apps::discord
include desktop_config::apps::burp
include desktop_config::apps::redshift
include desktop_config::apps::virtualbox
include desktop_config::apps::gron
include desktop_config::apps::docker
include desktop_config::apps::eclipse
