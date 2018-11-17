# desktop_config::zsh_setup

class desktop_config::zsh_setup {
  file {"/home/${config_user}/.zshrc":
    content => file("${module_name}/zshrc"),
  }
  
  file {$zshrc_dir:
    ensure => 'directory', 
  }

  exec {"clone-ngibb-zsh":
    user => $config_user,
    cwd => "/home/${config_user}/git",
    command => "/usr/bin/git clone  https://github.com/Ngibb/nolan-omzsh-theme.git",
    require => File["/home/${config_user}/git"],
    creates => "/home/${config_user}/git/nolan-omzsh-theme",
  }
  
  file {"/home/${config_user}/.oh-my-zsh/.nolan.zsh-theme":
    ensure => 'link', 
    target => "/home/${config_user}/git/nolan-omzsh-theme/.nolan.zsh-theme", 
    #require => "Exec['clone-ngibb-zsh']", 
  }
  
  file {"/root/.zshrc":
    ensure => 'link', 
    target => "/home/${config_user}/.zshrc", 
    owner => root,
    group => root,
  }
 
  $zshrc_files = [
    'alias.zsh',
    'localdev.zsh',
    'man.zsh',
    'vault.zsh',
  ]

  $zshrc_files.each |String $my_package|{
    file{"${zshrc_dir}/${my_package}":
      content => file("${module_name}/zshrcd/${my_package}"),
    }  
  }

  # configure_me_alias
  # The root puppet code file you are using to define your desktop 
  # This file for me
  $configure_me_file = "${workstation_config_dir}/configure_me.pp"
  file{"${zshrc_dir}/configure_me.zsh":
    content => template("${module_name}/zshrcd/configure_me.zsh.erb"),
  }  
}

