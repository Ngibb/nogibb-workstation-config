# desktop_config::apps::eclipse
# TODO: Install other plugins

class desktop_config::apps::eclipse (
  $install_dir = '/opt',
  $eclipse_dir = "${install_dir}/eclipse",
  $eclispe_version = lookup('eclipse.version', undef, undef, '2018-12')
){

  # From https://www.eclipse.org/downloads/packages/
  $download_uri="https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${eclispe_version}/R/eclipse-java-${eclispe_version}-R-linux-gtk-x86_64.tar.gz&r=1"

  # I guess "aptitude install" would work, but seems *old*
  exec {'install_eclipse':
    command => "wget '${download_uri}' -O /tmp/eclipse.tar.gz && tar xzf eclipse.tar.gz -C ${install_dir}",
    unless  => "test -e ${eclipse_dir}",
    cwd     => '/tmp/',
    path    => '/sbin/:/bin/:/usr/sbin:/usr/bin:/usr/local/bin', 
  }


  # Set bash alias to open eclipse
  $eclipse_exec_path="${eclipse_dir}/eclipse"
  file{"${zshrc_dir}/eclipse.zsh":
    content => "# open eclipse \n alias eclipse=\"${eclipse_exec_path}\"",
  }
  file{"${bashrc_dir}/eclipse.sh":
    content => "# open eclipse \n alias eclipse=\"${eclipse_exec_path}\"",
  }

}

