$wanted_packages = [
	'aptitude',
	'vim',
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
	'irssi',
	'terminator',
	'mtr',
	'strace',
	'wireshark',
	'nmap',
	'git',
	'iperf',
	'deluge',
	'iotop',
	'curl',
	'vlc',
	'netdiag',
	'rsync',
	'imagemagick',
	'jq',
	'redshift', #TODO: Configure this
#       'spotify-client',	
]



$wanted_packages.each |String $my_package|{
	package { $my_package:
		ensure => installed 
	}
}



apt::source {'debian_more':
  repos => 'main contrib non-free',
  comment => 'deb-src http://deb.debian.org/debian/ stretch main',
  release => 'stretch',
  location => 'http://deb.debian.org/debian/'
  #deb

}



# Intel wifidrivers
package { 'firmware-iwlwifi':
	ensure => installed 
}



