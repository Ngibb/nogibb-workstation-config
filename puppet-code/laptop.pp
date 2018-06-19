# TODO:
# terminator config
# ngibb shell
# oh-my-zsh
# oh my zsh theme
# dot files
# git config
# vim rc set t_BE= vim linux middle click 
# ssh authorized keys

# Vars

$config_user = 'ngibb'

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
        'spotify-client',
	'google-chrome-stable',
	'steam'
]

$wanted_packages.each |String $my_package|{
	package { $my_package:
		ensure => installed 
	}
}


#apt::source {'base':
#  comment => 'deb-src http://deb.debian.org/debian/ stretch main',
#  location => 'http://deb.debian.org/debian/',
#  release => 'stretch',
#  repos => 'main contrib non-free',
#  include => {
#    'deb' => true,
#    'src' => true,
#  },
#}

#apt::source {'base-security':
#  location => 'http://security.debian.org/debian-security/',
#  release => 'stretch/updates',
#  repos => 'main contrib',
#  include => {
#    'deb' => true,
#    'src' => true,
#  },
#}

apt::source {'spotify':
  comment => 'spotify',
  location => 'http://repository.spotify.com',
  release => 'stable',
  repos => 'non-free',
}

apt::source {'google-chrome':
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
 # key => {
 #   'server' => 'repo.steampowered.com',
 #   'id' => 'F24AEA9FB05498B7',
 # }
}

apt::source {'slack':
  comment => 'slack',
  location => 'https://packagecloud.io/slacktechnologies/slack/debian/',
  release => 'jessie',
  repos => 'main',
}

apt::source {'vivaldi':
  comment => 'vivaldi',
  location => 'http://repo.vivaldi.com/stable/deb/',
  release => 'stable',
  repos => 'main',
}

#apt::source {'docker':
#  comment => 'docker', 
#  location => 'https://download.docker.com/linux/debian/',
#  release => 'stretch',
#  repos => 'stable',
#  include => {
#    'deb' => true,
#    'src' => true,
#  },
#}



# Steam src?

# Intel wifidrivers
#package { 'firmware-iwlwifi':
#	ensure => installed 
#}

# Discord
# Slack
# Burp
# Vivaldi

file {'/etc/gitconfig':
  source => 'puppet:///modules/static_config/gitconfig', 
  require => File["/etc/puppet/code/modules/static_config"],
}

file {"/home/${config_user}/.vimrc":
  source => 'puppet:///modules/static_config/vimrc', 
  require => File["/etc/puppet/code/modules/static_config"],
}

file {"/home/${config_user}/.zshrc":
  source => 'puppet:///modules/static_config/zshrc', 
  require => File["/etc/puppet/code/modules/static_config"],
}

file {"/home/${config_user}/.config/terminator/config":
  source => 'puppet:///modules/static_config/terminator_config', 
  require => File["/etc/puppet/code/modules/static_config"],
}

file {"/home/${config_user}/git":
  ensure => 'directory', 
}

exec {"clone-ngibb-zsh":
  user => $config_user,
  cwd => "/home/${config_user}/git",
  command => "/usr/bin/git clone  https://github.com/Ngibb/nolan-omzsh-theme.git", 
  require => File["/home/${config_user}/git"],
  creates => "/home/${config_user}/git/nolan-omzsh-theme",
}

file {"/home/${config_user}/.oh-my-zsh/.nolan.zsh-theme":
  ensure => 'link', 
  target => "/home/${config_user}/git/nolan-omzsh-theme/.nolan.zsh-theme", 
  #require => "Exec['clone-ngibb-zsh']", 
}

file {"/etc/puppet/code/modules/static_config":
  ensure => 'link', 
  target => "/home/${config_user}/git/workstation-config/puppet-code/static_config", 
}


user{$config_user:
  ensure => present,
  shell => "/usr/bin/zsh",
  require => "Package[zsh]"
}



