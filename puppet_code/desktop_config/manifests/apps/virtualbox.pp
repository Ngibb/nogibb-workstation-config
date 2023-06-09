# desktop_config::apps::virtualbox
class desktop_config::apps::virtualbox {
  $virtualbox_version = lookup('virtualbox.version', undef, undef, '6.1')
  
  # We can't use virtualbox on a virtual host
  unless !$facts['virtual'] {
    apt::source {'virtualbox':
      comment => 'virtualbox',
      location => 'http://download.virtualbox.org/virtualbox/debian',
      release => 'buster',
      repos => 'contrib',
      key          => {
        id     => 'B9F8D658297AF3EFC18D5CDFA2F683C52980AECF',
        source => 'https://www.virtualbox.org/download/oracle_vbox_2016.asc',
      }
    }
  
    # Need to update before trying to install package 
    Class['apt::update'] ->
  
    package { "virtualbox-${virtualbox_version}":
      ensure => installed
    }
  }
}

