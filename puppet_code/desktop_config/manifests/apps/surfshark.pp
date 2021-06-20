# desktop_config::apps::surfshark

class desktop_config::apps::surfshark {

	$source_package='surfshark-release'

  exec {"install_surfshark_repo":
    command => "wget -q 'https://ocean.surfshark.com/debian/pool/main/s/surfshark-release/surfshark-release_1.0.0-2_amd64.deb' -O /tmp/${source_package}.deb && dpkg -i /tmp/${source_package}.deb",
    unless => "dpkg -l  | grep -iq '${source_package}'",
    cwd => "/tmp/",
    path => "/sbin/:/bin/:/usr/sbin:/usr/bin:/usr/local/bin", 
  } ->

  # Need to update before trying to install package 
  Class['apt::update']

   -> package { 'surfshark-vpn':
    ensure => installed
  }
}

