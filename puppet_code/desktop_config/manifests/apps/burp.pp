# desktop_config::apps::burp
# TODO: Install SAML raider and other plugins, load from a config file



class desktop_config::apps::burp(
  $edition = "community", 
  $version = "1.7.36",
  $install_dir = "${config_user_home_dir}/burp",
){

  $jar_name = "burpsuite_${edition}_v${version}.jar"
 
  file {$install_dir:
    ensure => directory
  }

  exec {"install_burp":
    command => "wget 'https://portswigger.net/burp/releases/download?product=${edition}&version=${version}&type=jar' -O ${install_dir}/${jar_name}",
    unless => "test -e ${install_dir}/${jar_name}",
    cwd => "/tmp/",
    path => "/sbin/:/bin/:/usr/sbin:/usr/bin:/usr/local/bin", 
  }

  file{"${zshrc_dir}/burp.zsh":
    content => template("${module_name}/shellrcd/burp.erb"),
  }
  file{"${bashrc_dir}/burp.sh":
    content => template("${module_name}/shellrcd/burp.erb"),
  }
}

