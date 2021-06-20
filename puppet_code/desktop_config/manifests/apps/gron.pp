# desktop_config::apps::gron
# https://github.com/tomnomnom/gron
# TODO: Make sure the ownership of the fire is correct

class desktop_config::apps::gron(
  $version = lookup('gron.version', undef, undef, '0.6.0'),
  $install_dir = "/usr/local/bin",
){

  file {$install_dir:
    ensure => directory
  }

  exec {"install_gron":
    command => "wget -q 'https://github.com/tomnomnom/gron/releases/download/v${version}/gron-linux-amd64-${version}.tgz' -O /tmp/gron.tgz && tar xzf gron.tgz && mv gron ${install_dir}",
    unless => "test -e ${install_dir}/gron",
    cwd => "/tmp/",
    path => "/sbin/:/bin/:/usr/sbin:/usr/bin:/usr/local/bin", 
  }

}

