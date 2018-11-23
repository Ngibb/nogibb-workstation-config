# desktop_config::bash_setup

class desktop_config::bash_setup {

  file {"/home/${config_user}/.bashrc":
    content => file("${module_name}/bashrc"),
  }
  
  file {$bashrc_dir:
    ensure => 'directory', 
  }
  
  file {"/root/.bashrc":
    ensure => 'link', 
    target => "/home/${config_user}/.bashrc", 
    owner => root,
    group => root,
  }
 
  $bashrc_files = [
    'alias',
    'localdev',
    'man',
    'vault',
  ]

  $bashrc_files.each |String $my_package|{
    file{"${bashrc_dir}/${my_package}.sh":
      content => file("${module_name}/shellrcd/${my_package}"),
    }  
  }

  # configure_me_alias
  # The root puppet code file you are using to define your desktop 
  # This file for me
  $configure_me_file = "${workstation_config_dir}/configure_me.pp"
  file{"${bashrc_dir}/configure_me.sh":
    content => template("${module_name}/shellrcd/configure_me.erb"),
  }  
}

