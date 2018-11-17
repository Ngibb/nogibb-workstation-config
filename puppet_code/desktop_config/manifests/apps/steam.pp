# desktop_config::apps::steam

class desktop_config::apps::steam {

  apt::source {'steam-puppet': 
    comment => 'steam', 
    architecture => 'amd64,i386', 
    location => 'http://repo.steampowered.com/steam/', 
    release => 'precise', 
    repos => 'steam', 
   # key => { 
   #   'server' => 'repo.steampowered.com', 
   #   'id' => 'F24AEA9FB05498B7', 
   # } 
  } 
 
  package { "steam":
    ensure => installed
  }

}

