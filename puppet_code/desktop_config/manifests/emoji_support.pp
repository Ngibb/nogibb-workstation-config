# desktop_config::emoji_support
# emoji support for the teminal, just black and white, havn't found color yet

class desktop_config::emoji_support {

  if $facts['os']['distro']['codename'] == "stretch" 
  {
    package{"ttf-ancient-fonts":
	    ensure => "present",
    }
	}

}
