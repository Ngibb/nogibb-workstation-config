# desktop_config::apps::git

class desktop_config::apps::git {

  package { "git":
    ensure => installed
  }

  file {"/home/${config_user}/git":
    ensure    => 'directory',
  }

  file {"/etc/gitconfig":
    content => file("${module_name}/gitconfig")
  }

}

