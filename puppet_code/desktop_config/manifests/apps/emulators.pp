# desktop_config::apps::emulators

class desktop_config::apps::emulators {

  # nes
 # package { "zsnes":
 #   ensure => installed
 # }

  # gba
  package { "visualboyadvance":
    ensure => installed
  }
  #package { "visualboyadvance-gtk":
  #  ensure => installed
  #}

}

