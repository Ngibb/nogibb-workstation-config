# TODO:
# ngibb shell
# oh-my-zsh
# oh my zsh theme
# dot files
# git config

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
        'openconnect',
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
	# Require other repos
#       'spotify-client',
	'google-chrome-stable',
	'steam'
]

$wanted_packages.each |String $my_package|{
	package { $my_package:
		ensure => installed 
	}
}


apt::source {'base':
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

apt::source {'steam-puppet':
  comment => 'steam',
  architecture => 'amd64,i386',
  location => 'http://repo.steampowered.com/steam/',
  release => 'precise',
  repos => 'steam',
}
# Steam src?

# Intel wifidrivers
package { 'firmware-iwlwifi':
	ensure => installed 
}

# Discord
# Slack
# Burp
# Vivaldi



