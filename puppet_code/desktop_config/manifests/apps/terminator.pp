# desktop_config::apps::terminator

class desktop_config::apps::terminator {

  package { "terminator":
    ensure => installed
  }

	file{"terminator_config_dir":
	  ensure => "directory",
    path => "/home/${config_user}/.config/terminator",
	}

  file {"/home/${config_user}/.config/terminator/config":
    content => file("${module_name}/terminator_config"),
    require => File["terminator_config_dir"] 
  }

}

