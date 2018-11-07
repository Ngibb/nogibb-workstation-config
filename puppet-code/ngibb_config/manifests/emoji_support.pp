# ngibb_config::emoji_support
# emoji support for the teminal, just black and white, havn't found color yet

class ngibb_config::emoji_support {

	package{"ttf-ancient-fonts":
	  ensure => "present",
	}

}

