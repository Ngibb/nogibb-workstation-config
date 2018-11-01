# ngibb_config::okta_aws_cli

class ngibb_config::okta_aws_cli {

	$okta_config_dir = "/home/${config_user}/.okta"
	file{"okta_aws_cli_config_dir":
	  ensure => "directory",
          path => $okta_config_dir ,
	  backup => ".backup",
	  owner => $config_user,
          group => $config_user,
	}
	file{"${okta_config_dir}/config.properties":
          content => file("${module_name}/config.properties"),
  	  require => File["okta_aws_cli_config_dir"],
	  owner => $config_user,
          group => $config_user,
	}
        exec {"okta_aws_cli_jar":
	  creates => "/home/${config_user}/bin/okta-aws-cli.jar",
          command => "wget https://github.com/oktadeveloper/okta-aws-cli-assume-role/releases/download/v1.0.5/okta-aws-cli-1.0.5.jar && cp okta-aws-cli*.jar /home/${config_user}/bin/okta-aws-cli.jar && chown ${config_user}:${config_user} /home/${config_user}/bin/okta-aws-cli.jar",
          cwd => "/tmp/",
          path => "/bin/:/usr/bin", 
	}




#- vi ~./bashrc
#- add line at the bottom of the file
#- alias okta-aws=‘/usr/bin/java -jar /Users/ddmitriy/.okta/okta-aws-cli-1.0.5.jar’
#- run source ~/.bashric
#java -jar okta-aws-cli-1.0.5.jar
#
#you should see the window, use okta and duo to authenticate
#
#test
#java -jar okta-aws-cli-1.0.5.jar s3 ls
}

