# desktop_config::apps::slack

class desktop_config::apps::slack {

  apt::source {'slack':
    comment => 'slack',
    location => 'https://packagecloud.io/slacktechnologies/slack/debian/',
    release => 'jessie', #highest release available
    repos => 'main',
    key          => {
      'id'     => 'DB085A08CA13B8ACB917E0F6D938EC0D038651BD',
    }
  }  

  # Need to update before trying to install package 
  Class['apt::update'] ->

  package { "slack-desktop":
    ensure => installed
  }

}

