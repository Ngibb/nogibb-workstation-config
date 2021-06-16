# desktop_config::apps::spotify

class desktop_config::apps::spotify {

  apt::source {'spotify':
    comment => 'spotify',
    location => 'http://repository.spotify.com',
    release => 'stable',
    repos => 'non-free',
    key          => 
    {
      'id' => '8FD3D9A8D3800305A9FFF259D1742AD60D811D58'
    }
  }

  # Need to update before trying to install package 
  Class['apt::update'] ->

  package { "spotify-client":
    ensure => installed
  }

}

