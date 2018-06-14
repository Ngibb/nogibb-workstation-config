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
  comment => 'deb-src http://deb.debian.org/debian/ stretch main',
  location => 'http://deb.debian.org/debian/',
  release => 'stretch',
  repos => 'main contrib non-free',
}

apt::source {'spotify-puppet':
  comment => 'spotify',
  location => 'http://repository.spotify.com',
  release => 'stable',
  repos => 'non-free',
}

apt::source {'google-puppet':
  comment => 'chrome',
  architecture => 'amd64',
  location => 'http://dl.google.com/linux/chrome/deb/',
  release => 'stable',
  repos => 'main',
}


# Intel wifidrivers
package { 'firmware-iwlwifi':
	ensure => installed 
}



