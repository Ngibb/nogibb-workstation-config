# desktop_config::apps::docker
# Docker is straight broken on my computer

class desktop_config::apps::dock {

  apt::source {'docker':
    comment => 'docker', 
    location => 'https://download.docker.com/linux/debian/',
    release => 'stretch',
    repos => 'stable',
    include => {
      'deb' => true,
      'src' => true,
    },
  }

  # Is this even right? 
  package { "docker-ce":
    ensure => installed
  }

}

