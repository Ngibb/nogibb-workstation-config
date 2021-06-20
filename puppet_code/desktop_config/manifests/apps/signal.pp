# desktop_config::apps::signal

class desktop_config::apps::signal {

  # configure source for package
  # https://signal.org/en/download/#
  # Yes, it's xenial. That is from signal's download page *shrug*
  apt::source {'signal-xenial':
    comment      => 'signal',
    architecture => 'amd64',
    location     => 'https://updates.signal.org/desktop/apt',
    release      => 'xenial',
    repos        => 'main',
    key          => {
      id     => 'DBA36B5181D0C816F630E889D980A17457F6FB06',
      source => 'https://updates.signal.org/desktop/apt/keys.asc',
    }
  }

  # Need to update before trying to install package 
  Class['apt::update']
  # install packages
  -> package {'signal-desktop':
    ensure => 'present'
  }

}
