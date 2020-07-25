# is good to have, makes some apps happy, like synergy

class desktop_config::apps::system_tray_icons {
  
  package { "gnome-shell-extension-appindicator":
    ensure => installed
  }

}
