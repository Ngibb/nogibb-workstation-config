# desktop_config::motd
class desktop_config::motd {

  file {"/etc/motd":
    ensure => 'file', 
    owner  => root,
    group  => root,
    source => [
      "puppet:///${desktop_config_dir}/files/motds/${facts['hostname']}-motd",
      "puppet:///${desktop_config_dir}/files/motds/${host_type}-motd",
      "puppet:///${desktop_config_dir}/files/motds/default-motd",
      
    ]
  }

}

