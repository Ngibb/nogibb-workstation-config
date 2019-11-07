# desktop_config::apps::spotify

class desktop_config::apps::spotify {

  apt::source {'spotify':
    comment => 'spotify',
    location => 'http://repository.spotify.com',
    release => 'stable',
    repos => 'non-free',
    key          => {
      'id'     => '2EBF997C15BDA244B6EBF5D84773BD5E130D1D45',
      'server' => 'keyserver.ubuntu.com',
    }
  }

  # Need to update before trying to install package 
  Class['apt::update'] ->

  package { "spotify-client":
    ensure => installed
  }

}

