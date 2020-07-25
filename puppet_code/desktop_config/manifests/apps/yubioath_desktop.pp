

class desktop_config::apps::yubioath_desktop {

  $current_release = $facts['os']['distro']['codename']

  if $current_release == "buster" {
    # for yubioath-desktop, stretch ends up working the best
    apt::source {'stretch':
      location => 'http://deb.debian.org/debian/',
      repos    => "main contrib non-free",
      release  => 'stretch',
      pin      => 150, 
      include  => {
        'src' => true,
        'deb' => true,
      }
    } 
  }

  # Need to update before trying to install package 
  Class['apt::update'] ->

  package { "yubioath-desktop":
    ensure => installed
  }

}
