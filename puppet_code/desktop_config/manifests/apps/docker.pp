# desktop_config::apps::docker

class desktop_config::apps::docker {

  apt::source {'docker':
    comment => 'docker', 
    architecture => 'amd64',
    location => 'https://download.docker.com/linux/debian/',
    release => "${facts['os']['distro']['codename']}",
    repos => 'stable',
    key => {
      id     => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
      source => 'https://download.docker.com/linux/debian/gpg',
    },
  }

  # Need to update before trying to install package 
  Class['apt::update']

  -> package { 'docker-ce':
    ensure => installed
  }

  group {'docker':
    members => [$config_user]
  }
  # Add config user to docker group

}

