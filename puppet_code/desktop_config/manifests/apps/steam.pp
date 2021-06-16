# desktop_config::apps::steam

class desktop_config::apps::steam {


# having debian backports installed and pinned is really important for getting the i386 libgl1 packages in a sane fashion
  # install package
  # have to accept the license manually
  package { "steam":
    ensure => installed
  }

#  # B/c it sometimes isn't installed?
#  package { "libgl1-nvidia-glvnd-glx:i386":
#    ensure => installed
#  }

#  package { "nvidia-driver-libs-i386":
#    ensure => installed
#  }
  
  # adjust arch
  exec {"enable_i38":
    command => "dpkg --add-architecture i386",
    unless => "dpkg --print-foreign-architectures | grep -q i386",
    cwd => "/tmp/",
    path => "/sbin/:/bin/:/usr/sbin:/usr/bin:/usr/local/bin", 
  }
  

  # IDK?
  #apt::source {'steam': 
  #  comment => 'steam', 
  #  architecture => 'amd64,i386', 
  #  location => 'http://repo.steampowered.com/steam/', 
  #  release => 'precise', 
  #  repos => 'steam', 
  # # key => { 
  # #   'server' => 'repo.steampowered.com', 
  # #   'id' => 'F24AEA9FB05498B7', 
  # # } 
  #} 
  ##echo "deb [arch=amd64,i386] http://repo.steampowered.com/steam/ precise steam" >> /etc/apt/sources.list.d/steam.list
  ##echo "deb-src [arch=amd64,i386] http://repo.steampowered.com/steam/ precise steam" >> /etc/apt/sources.list.d/steam.list
  #dpkg --add-architecture i386
  # apt install ?? no aptitude 
  # https://wiki.debian.org/Steam 

}

