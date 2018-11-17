# desktop_config::apps::terminator

class desktop_config::apps::terminator {

  package { "terminator":
    ensure => installed
  }

  file {"/home/${config_user}/.config/terminator/config":
    content => file("${module_name}/terminator_config"),
  }

}

