# desktop_config::apps::okta_aws_cli

class desktop_config::apps::okta_aws_cli {

	$okta_config_dir = "/home/${config_user}/.okta"

	file{"okta_aws_cli_config_dir":
	  ensure => "directory",
          path => $okta_config_dir ,
	  backup => ".backup",
	}

	file{"${okta_config_dir}/config.properties":
    content => file("${module_name}/config.properties"),
    require => File["okta_aws_cli_config_dir"],
	}

	file{"${okta_config_dir}/bash_functions":
          content => file("${module_name}/okta_bash_functions"),
  	  require => File["okta_aws_cli_config_dir"],
	}

        exec {"okta_aws_cli_jar":
	  creates => "${okta_config_dir}/okta-aws-cli.jar",
          command => "wget https://github.com/oktadeveloper/okta-aws-cli-assume-role/releases/download/v1.0.5/okta-aws-cli-1.0.5.jar && cp okta-aws-cli*.jar ${okta_config_dir}/okta-aws-cli.jar && chown ${config_user}:${config_user} ${okta_config_dir}/okta-aws-cli.jar",
          cwd => "/tmp/",
          path => "/bin/:/usr/bin", 
	}

	package{"awscli":
	  ensure => "present",
	}

	$aws_config_dir = "/home/${config_user}/.aws"

	file{"aws_config_dir":
	  ensure => "directory",
    path => $aws_config_dir ,
	}

	file{"${aws_config_dir}/config":
    content => file("${module_name}/aws_config"),
    require => File["aws_config_dir"],
	}

	# I don't know if this will be required on everyone
	#package{"libcanberra-gtk-module":
	#  ensure => "present",
	#}

	file{"${zshrc_dir}/okta_aws.zsh":
          content => file("${module_name}/shellrcd/okta_aws"),
	}
	file{"${bashrc_dir}/okta_aws.sh":
          content => file("${module_name}/shellrcd/okta_aws"),
	}

	# leaving commented, don't know if all hosts will need
	#package {"openjfx":
	#  ensure => "present",
	#}

}

