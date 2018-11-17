# desktop_config::not_workstation

class desktop_config::not_workstation {
	$zshrc_dir = "/home/ngibb/.zshrc.d"
	file{"${zshrc_dir}/not_workstation.zsh":
	  content => file("${module_name}/zshrcd/not_workstation.zsh"),
	}
}

