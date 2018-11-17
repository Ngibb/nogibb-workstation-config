# desktop_config_laptop
class desktop_config::laptop {
	# Intel wifidrivers
	package { 'firmware-iwlwifi':
		ensure => installed 
	}
	# exec, rekick the module
	# modprobe -r iwlwifi ; modprobe iwlwifi

	include desktop_config::not_workstation

}

