# desktop_config_homestation
class desktop_config::homestation {
  include desktop_config::not_workstation
  include desktop_config::apps::steam
	include desktop_config::apps::discord
  include desktop_config::apps::emulators
 
  # Xbox Controller drivers
  package {"xboxdrv":
    ensure => installed
  } 
}

