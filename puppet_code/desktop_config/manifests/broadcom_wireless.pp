# desktop_config::broadcom_wireless 

class desktop_config::broadcom_wireless {
    package{'broadcom-sta-dkms':
      ensure => 'present',
    }
}
