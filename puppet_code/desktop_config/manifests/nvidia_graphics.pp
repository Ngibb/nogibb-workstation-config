# desktop_config::nvidia_graphics

class desktop_config::nvidia_graphics {
    package{'nvidia-kernel-dkms':
      ensure => 'present',
    }
}
