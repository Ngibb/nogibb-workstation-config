# desktop_config::debian_sources
# puts in place the sources.list and source.list.d/base.list

class desktop_config::debian_sources(
){

  apt::source { "base_ftp_us":
    location => 'http://ftp.us.debian.org/debian/',
    repos    => 'main',
    release  => $facts['os']['distro']['codename'],
    include  => {
     'src' => true,
     'deb' => true,
   }
  }

  apt::source { "base_security":
    location => 'http://security.debian.org/debian-security',
    repos    => 'main',
    release  => "${facts['os']['distro']['codename']}/updates",
    include  => {
     'src' => true,
     'deb' => true,
   }
  }

  apt::source {'base':
    location => 'http://deb.debian.org/debian/',
    release  => $facts['os']['distro']['codename'],
    repos    => "main contrib non-free",
    include  => {
      'src' => true,
      'deb' => true,
    }
  } 
 
}
