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

  # Need to update before trying to install package 
  Class['apt::update'] ->

  package { "google-chrome-stable":
    ensure => installed
  }


  # kerberos
  $auth_server_whitelist = lookup('chrome.kerbconfig.auth_server_whitelist')#, undef, undef, false)
  if $auth_server_whitelist {
    file {'/etc/opt/chrome/policies':
      ensure => 'directory',
      owner  => root,
      group  => root,
    }

    file {'/etc/opt/chrome/policies/managed':
      ensure => 'directory',
      owner  => root,
      group  => root,
    }

    file {'/etc/opt/chrome/policies/managed/kerb.json':
      ensure  => 'file',
      content => template("${module_name}/google-chrome/kerb.json.erb"),
      owner   => root,
      group   => root,
      require => Package['google-chrome-stable']
    }
  }
}

