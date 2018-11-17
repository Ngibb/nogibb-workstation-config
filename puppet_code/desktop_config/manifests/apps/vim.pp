# desktop_config::apps::vim

class desktop_config::apps::vim {

  package { "vim":
    ensure => installed
  }

  file {"/home/${config_user}/.vimrc":
    content => file("${module_name}/vimrc"),
  }

}

