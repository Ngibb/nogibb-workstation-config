# desktop_config::apps::aws_es_proxy

class desktop_config::apps::aws_es_proxy(
  $version = lookup('aws_es_proxy::version', undef, undef, '0.9'),
  $install_dir = "${config_user_home_dir}/bin",
){
  $binary_name = "aws-es-proxy-linux-amd64"

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

  file {"${install_dir}/aws_kibana_wrapper.sh":
   owner   => $config_user,
   group   => $config_user,
   mode    => "u+x",
   content => file("${module_name}/aws_okta/aws_kibana_wrapper.sh"),
  }
}

