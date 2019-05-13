# desktop_config::apps::pathogen_plugin

define desktop_config::apps::pathogen_plugin(
  $git_url       = "",
  $install_dir   = "/home/${config_user}/.vim/bundle/",
  $creates_file  = "${install_dir}${name}"
){
  exec {"clone_pathogen_plugin_${name}}":
    user    => $config_user,
    cwd     => $install_dir,
    command => "/usr/bin/git clone ${git_url}",
    require => File["/home/${config_user}/.vim/bundle/"],
    creates => "${creates_file}",
  }
}

