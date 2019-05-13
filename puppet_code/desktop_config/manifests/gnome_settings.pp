# desktop_config::gnome_settings

class desktop_config::gnome_settings {

   #TODO: warn if use is not using gnome

   $gnome_config = [
        {
          "path"  => "org.gnome.desktop.interface",  
          "key"   => "gtk-theme",
          "value" => "'Adwaita-dark'",
        },{
          "path"  => "org.gnome.desktop.interface",
          "key"   => "clock-show-seconds",
          "value" => "true",
        },{
          "path"  => "org.gnome.desktop.interface",
          "key"   => "clock-show-date",
          "value" => "true",
        },{
          "path"  => "org.gnome.desktop.wm.preferences",
          "key"   => "action-middle-click-titlebar",
          "value" => "'lower'",
        },{
          "path"  => "org.gnome.shell.overrides",
          "key"   => "workspaces-only-on-primary",
          "value" => "true",
        },{
          "path"  => "org.gnome.desktop.background",
          "key"   => "picture-uri",
          "value" => "'${config_user_home_dir}/Pictures/background'",
        },{
          "path"  => "org.gnome.desktop.screensaver",
          "key"   => "picture-uri",
          "value" => "'${config_user_home_dir}/Pictures/screensaver'",
    	  },
   ]

  $gnome_config.each |Hash $def_hash|{
    exec {"gsetting_${def_hash[path]}_${def_hash[key]}_${def_hash[value]}":
      user    => $config_user,
      command => "gsettings set ${def_hash[path]} ${def_hash[key]} ${def_hash[value]}",
      unless  => "gsettings get ${def_hash[path]} ${def_hash[key]} | grep -q \"${def_hash[value]}\"",
      path    => "/bin:/usr/bin/"
    }
  }

  file {"${config_user_home_dir}/Pictures/background":
    ensure => 'file', 
    source => [
      "puppet:///${desktop_config_dir}/files/images/${facts['hostname']}-background",
      "puppet:///${desktop_config_dir}/files/images/${host_type}-background",
      "puppet:///${desktop_config_dir}/files/images/default-background",
    ]
  }

  file {"${config_user_home_dir}/Pictures/icon":
    ensure => 'file', 
    source => [
      "puppet:///${desktop_config_dir}/files/images/${facts['hostname']}-icon",
      "puppet:///${desktop_config_dir}/files/images/${host_type}-icon",
      "puppet:///${desktop_config_dir}/files/images/default-icon",
    ]
  }

  file {"${config_user_home_dir}/Pictures/screensaver":
    ensure => 'file', 
    source => [
      "puppet:///${desktop_config_dir}/files/images/${facts['hostname']}-screensaver",
      "puppet:///${desktop_config_dir}/files/images/${host_type}-screensaver",
      "puppet:///${desktop_config_dir}/files/images/${facts['hostname']}-background",
      "puppet:///${desktop_config_dir}/files/images/${host_type}-background",
      "puppet:///${desktop_config_dir}/files/images/default-background",
    ]
  }

}

