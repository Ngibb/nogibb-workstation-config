# ngibb_config_laptop
class ngibb_config::laptop {
	# Intel wifidrivers
	package { 'firmware-iwlwifi':
		ensure => installed 
	}
	# exec, rekick the module
	# modprobe -r iwlwifi ; modprobe iwlwifi

}

