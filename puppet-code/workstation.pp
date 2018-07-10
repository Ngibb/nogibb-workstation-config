# TODO:
# ngibb shell
# oh-my-zsh
# oh my zsh theme
# dot files
# vim rc set t_BE= vim linux middle click 
# ssh authorized keys
# fail2ban
# multitail 

# Vars

$config_user = 'ngibb'
$workstation_config_dir = "/home/${config_user}/git/workstation-config"
$static_config_dir = "${workstation_config_dir}/puppet-code/ngibb_config"

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
	'ddd', #debugger
	'redshift', #TODO: Configure this
	# Require other repos
        #'spotify-client',
	#'google-chrome-stable',
	#'steam'
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
## exec, rekick the module
# modprobe -r iwlwifi ; modprobe iwlwifi



# Discord
# Slack
# Burp
# Vivaldi


file {"/home/${config_user}/git":
  ensure => 'directory', 
}

file {"/home/${config_user}/.irssi":
  ensure => 'directory', 
}

file {"/home/${config_user}/.irssi/config":
  ensure => 'link', 
  target => "${static_config_dir}/files/irssi/irssi_config", 
}

file {"/home/${config_user}/.irssi/foxmask.theme":
  ensure => 'link', 
  target => "${static_config_dir}/files/irssi/foxmask.theme", 
}

file {"/home/${config_user}/.vimrc":
  ensure => 'link', 
  target => "${static_config_dir}/files/vimrc", 
}

file {"/home/${config_user}/.zshrc":
  ensure => 'link', 
  target => "${static_config_dir}/files/zshrc", 
}

file {"/root/.zshrc":
  ensure => 'link', 
  target => "/home/${config_user}/.zshrc", 
}

file {"/home/${config_user}/.config/terminator/config":
  ensure => 'link', 
  target => "${static_config_dir}/files/terminator_config", 
}

file {"/etc/motd":
  ensure => 'link', 
  target => "${static_config_dir}/files/${facts['hostname']}-motd",
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

file {"/etc/puppet/code/modules/ngibb_config":
  ensure => 'link', 
  target => "/home/${config_user}/git/workstation-config/puppet-code/ngibb_config", 
}


user{$config_user:
  ensure => present,
  shell => "/usr/bin/zsh",
  require => "Package[zsh]"
}

file {"/etc/opt/chrome/policies/managed/kerb.json":
  ensure => 'file',
  source => ["puppet:///modules/ngibb_config/google-chrome/kerb.json",],
}

include ngibb_config::laptop
