# desktop_config::apps::irssi

class desktop_config::apps::irssi {

  package { "irssi":
    ensure => installed
  }

  file {"/home/${config_user}/.irssi":
    ensure => 'directory',
  }
  
  file {"/home/${config_user}/.irssi/config":
    content => file("${module_name}/irssi/irssi_config"),
  }
  
  file {"/home/${config_user}/.irssi/foxmask.theme":
    content => file("${module_name}/irssi/foxmask.theme"),
  }

}

