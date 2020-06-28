# desktop_config::debian_sources
# puts in place the sources.list and source.list.d/base.list

class desktop_config::debian_sources(
){
  $current_release = $facts['os']['distro']['codename']

  $desired_release = lookup("desired_debian_release", String, "first", "buster")

  apt::source { "base_ftp_us":
    location => 'http://ftp.us.debian.org/debian/',
    repos    => 'main',
    release  => $desired_release,
    include  => {
     'src' => true,
     'deb' => true,
   }
  }

  apt::source { "base_security":
    location => 'http://security.debian.org/debian-security',
    repos    => 'main',
    release  => "${desired_release}/updates",
    include  => {
     #'src' => true,
     'deb' => true,
   }
  }

  apt::source {'base':
    location => 'http://deb.debian.org/debian/',
    repos    => "main contrib non-free",
    release  => $desired_release,
    include  => {
      'src' => true,
      'deb' => true,
    }
  } 

 # apt::backports { 'backport':
 #   location => 'http://deb.debian.org/debian',
 #   repos    => "main",
 #   release  => $desired_release,
 #   pin      => 200,
 #   include  => {
 #     'deb' => true,
 #   }
 # }
  class { 'apt::backports':
    location => 'http://deb.debian.org/debian',
    repos    => "main",
    release  => "${desired_release}-backports",
    pin      => 200,
    include  => {
      'deb' => true,
    }
  }

}
