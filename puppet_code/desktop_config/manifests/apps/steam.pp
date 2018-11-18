# desktop_config::apps::steam

class desktop_config::apps::steam {

  # install package
  package { "steam":
    ensure => installed
  }
  
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

