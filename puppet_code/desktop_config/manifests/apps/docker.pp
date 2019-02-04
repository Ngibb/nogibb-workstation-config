# desktop_config::apps::docker
# Docker is straight broken on my computer

class desktop_config::apps::docker {

  apt::source {'docker':
    comment => 'docker', 
    architecture => 'amd64',
    location => 'https://download.docker.com/linux/debian/',
    release => 'stretch',
    repos => 'stable',
    key => {
      id     => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
      source => 'https://download.docker.com/linux/debian/gpg',
    },
  }

  # Is this even right? 
  package { "docker-ce":
   ensure => installed
  }

}

