# desktop_config::apps::spotify

class desktop_config::apps::spotify {

  apt::source {'spotify':
    comment => 'spotify',
    location => 'http://repository.spotify.com',
    release => 'stable',
    repos => 'non-free',
    key          => {
      'id'     => '931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90',
      'server' => 'keyserver.ubuntu.com',
    }
  }

  package { "spotify-client":
    ensure => installed
  }

}

