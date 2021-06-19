# desktop_config::apps::git

class desktop_config::apps::git {

  package { "git":
    ensure => installed
  }

  file {"/home/${config_user}/git":
    ensure    => 'directory',
  }

  $git_human_name = lookup('git.config.username')
  $git_email      = lookup('git.config.email')

  file {'/etc/gitconfig':
    content => template("${module_name}/gitconfig.erb")
  }

}

