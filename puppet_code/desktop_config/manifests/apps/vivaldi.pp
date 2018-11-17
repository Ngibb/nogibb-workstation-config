# desktop_config::apps::vivaldi

class desktop_config::apps::vivaldi {

  apt::source {'vivaldi':
    comment => 'vivaldi',
    location => 'http://repo.vivaldi.com/stable/deb/',
    release => 'stable',
    repos => 'main',
    key          => {
      'id'     => '6BA2B0F3B8B061697E98ADFA6D3789EDC3401E12',
      'source' => 'http://repo.vivaldi.com/stable/linux_signing_key.pub',
    }
  }

  package { "vivaldi":
    ensure => installed
  }

}

