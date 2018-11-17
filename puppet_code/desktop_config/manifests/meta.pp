# desktop_config::meta
class desktop_config::meta {

  # set up the link to the puppet code dir that root will use
  # you will want to run as sudo
  file {"${puppet_code_dir}/desktop_config":
    ensure => 'link',
    target => "${desktop_config_dir}",
    owner => root,
    group => root,
  }

}

