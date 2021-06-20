# User who this is being configed for
$config_user = lookup(config_user, String)

$config_user_home_dir = "/home/${config_user}"
$zshrc_dir = "${config_user_home_dir}/.zshrc.d"
$bashrc_dir = "${config_user_home_dir}/.bashrc.d"
# where this git repo lives
$workstation_config_dir = "/home/${config_user}/git/workstation-config"

# default behavior for the file file type
File {
  backup => '.backup',
  owner => $config_user,
  group => $config_user,
  show_diff => true,
}

$wanted_packages = [
	'aptitude',
	'bless', # hex editor
	'cgdb',
	'cryptsetup',
	'curl',
	'ddd', # debugger
	'deluge',
	'dnsutils',
	'dos2unix',
	'gcc',
	'gdb',
	'geoip-bin',
	'imagemagick',
	'iotop',
	'iperf',
	'jq',
	'keepass2',
	'keepassx',
	'libfdisk1',
	'libreoffice',
	'mlocate',
	'mtr',
	'multitail',
	'netdiag',
	'nmap',
	'openconnect',
	'rsync',
	'strace',
	'unzip',
	'vlc',
	'whois',
	'wireshark',
	'zsh',
  'htop',
  'packer', # aws image creation 
]

# Packages I want / are useful
$wanted_packages.each |String $my_package|{
	package { $my_package:
		ensure => installed 
	}
}

$unwanted_packages = [
	'aisleriot',
	'five-or-more',
	'four-in-a-row',
	'gnome-chess',
	'gnome-klotski',
	'gnome-mahjongg',
	'gnome-mines',
	'gnome-nibbles',
	'gnome-robots',
	'gnome-sudoku',
	'gnome-taquin',
	'gnome-tetravex',
	'hitori',
	'hoichess',
	'iagno',
	'lightsoff',
	'quadrapassel',
	'swell-foop',
	'tali'
]

# Packages I don't want
$unwanted_packages.each |String $not_my_package|{
  package { $not_my_package:
    ensure => absent
  }
}

user { $config_user:
  ensure => present,
  shell => "/usr/bin/zsh",
  require => "Package[zsh]",
}

# Essentials
include desktop_config::debian_sources
include desktop_config::zsh_setup
include desktop_config::bash_setup

#Tools
include desktop_config::apps::aws_es_proxy
include desktop_config::apps::aws_okta_cli #still needs refactor 
include desktop_config::apps::chrome
include desktop_config::apps::docker   # add user to group
include desktop_config::apps::virtualbox
include desktop_config::apps::terraform
include desktop_config::apps::slack
include desktop_config::apps::vim
include desktop_config::apps::git
include desktop_config::apps::burp
include desktop_config::apps::gron
include desktop_config::apps::eclipse
include desktop_config::apps::vscode
include desktop_config::apps::signal
include desktop_config::apps::obs_studio # We could compile this from source, but this is good enough for now
include desktop_config::apps::surfshark
include desktop_config::apps::system_tray_icons
include desktop_config::apps::terminator
include desktop_config::apps::yubioath_desktop

# Fun :)
include desktop_config::apps::spotify
if lookup(install_games, Boolean, 'first', false ) {
  include desktop_config::games
}
if lookup(broadcom_wifi_card, Boolean, 'first', false ) {
  include desktop_config::broadcom_wireless
}
if lookup(broadcom_wifi_card, Boolean, 'first', false ) {
  include desktop_config::nvidia_graphics
}
