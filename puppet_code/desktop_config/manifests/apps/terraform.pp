# desktop_config::apps::terraform

class desktop_config::apps::terraform {
  $terraform_version = lookup('terraform.version', undef, undef, "1.2.2")
  $terraform_install_location = '/usr/local/bin/terraform'

  exec {"install_terraform":
    command => "wget https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip && unzip terraform_${terraform_version}_linux_amd64.zip && mv terraform ${terraform_install_location} ",
    cwd     => "/tmp/",
    path    => "/bin/:/usr/bin",
    unless  => "ls ${terraform_install_location} && ${terraform_install_location} --version | grep -q \"v${terraform_version}\""
  }
  
  file{"${zshrc_dir}/terrafrom_tab_complete.zsh":
    content => file("${module_name}/shellrcd/terraform_tab_complete"),
  }
  
  file{"${bashrc_dir}/terrafrom_tab_complete.sh":
    content => file("${module_name}/shellrcd/terraform_tab_complete"),
  }
}

