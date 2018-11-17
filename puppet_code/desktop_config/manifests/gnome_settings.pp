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
          "path"  => "org.gnome.shell.extensions.classic-overrides",
          "key"   => "button-layout",
          "value" => "'appmenu:minimize,maximize,close'",
        },{
          "path"  => "org.gnome.desktop.wm.preferences",
          "key"   => "action-middle-click-titlebar",
          "value" => "'lower'",
        },{
          "path"  => "org.gnome.shell.overrides",
          "key"   => "workspaces-only-on-primary",
          "value" => "true",
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

}

