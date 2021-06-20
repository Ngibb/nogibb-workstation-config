# desktop_config::apps::steam

class desktop_config::apps::steam {
  # install package
  package { "libgl1-mesa-glx:i386":
    ensure => absent
  }

  # having debian backports installed and pinned is really important for getting the i386 libgl1 packages in a sane fashion
  # have to accept the license manually
  -> package { "steam":
    ensure => installed
  }

  
  # adjust arch
  exec {"enable_i38":
    command => "dpkg --add-architecture i386",
    unless => "dpkg --print-foreign-architectures | grep -q i386",
    cwd => "/tmp/",
    path => "/sbin/:/bin/:/usr/sbin:/usr/bin:/usr/local/bin", 
  }

}

