# desktop_config::apps::chrome

class desktop_config::apps::chrome {
  
  apt::source {'google-chrome':
    comment      => 'chrome',
    architecture => 'amd64',
    location     => 'http://dl.google.com/linux/chrome/deb/',
    release      => 'stable',
    repos        => 'main',
    key          => {
      'id'     => 'EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796',
      'source' => 'https://dl.google.com/linux/linux_signing_key.pub',
    }
  }

  package { "google-chrome-stable":
    ensure => installed
  }
 
  # kerberos
  file {"/etc/opt/chrome/policies/managed/kerb.json":
    ensure => 'file',
    source => ["puppet:///modules/desktop_config/google-chrome/kerb.json",],
    owner => root,
    group => root,
  }


  #file {"/home/ngibb/.config/google-chrome/Default/Bookmarks":
  #  ensure => 'link', 
  #  target => "/home/${config_user}/git/workstation-config/puppet-code/desktop_config/files/google-chrome/Bookmarks", 
  #}

}

