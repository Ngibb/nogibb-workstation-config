# desktop_config::not_workstation

class desktop_config::not_workstation {
	file{"${zshrc_dir}/not_workstation.zsh":
	  content => file("${module_name}/shellrcd/not_workstation"),
	}
	file{"${bashrc_dir}/not_workstation.sh":
	  content => file("${module_name}/shellrcd/not_workstation"),
	}
}

