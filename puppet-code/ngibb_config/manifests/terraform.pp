# ngibb_config::terraform

class ngibb_config::terraform {
        exec {"install_terraform":
	  creates => "/usr/local/bin/terraform",
          command => "wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip && unzip terraform*.zip && mv terraform /usr/local/bin",
          cwd => "/tmp/",
          path => "/bin/:/usr/bin", 
	}

	file{"${zshrc_dir}/terrafrom_tab_complete.zsh":
          content => file("${module_name}/zshrcd/terraform_tab_complete.zsh"),
	}
}

