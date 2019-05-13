# desktop_config::apps::aws_es_proxy
# TODO: Write a little ruby wrapper to that takes the role
#       es url and opens a browser

class desktop_config::apps::aws_es_proxy(
  $version = "0.9",
  $install_dir = "${config_user_home_dir}/bin",
){
  $binary_name = "aws-es-proxy-${version}-linux-amd64"

  file {$install_dir:
    ensure => directory
  }

  exec {"install_aws_es_proxy":
    command => "wget 'https://github.com/abutaha/aws-es-proxy/releases/download/v${version}/aws-es-proxy-${version}-linux-amd64' -O ${install_dir}/${binary_name}",
    unless => "test -e ${install_dir}/${binary_name}",
    cwd => "/tmp/",
    path => "/sbin/:/bin/:/usr/sbin:/usr/bin:/usr/local/bin",
  }

  file {"${install_dir}/${binary_name}":
   owner => $config_user,
   group => $config_user,
   mode  => "u+x",
  }
}

