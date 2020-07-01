# desktop_config::apps::obs_studio
# Based on https://obsproject.com/download

class desktop_config::apps::obs_studio {
  tag 'obs'

  package { "obs-studio":
    ensure => installed
  }

  package { "ffmpeg":
    ensure => installed
  }

}

