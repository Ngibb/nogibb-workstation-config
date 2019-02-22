# desktop_config::apps::virtualbox

class desktop_config::apps::virtualbox {

  apt::source {'virtualbox':
    comment => 'virtualbox',
    location => 'http://download.virtualbox.org/virtualbox/debian',
    release => 'stretch',
    repos => 'contrib',
    key          => {
      id     => 'B9F8D658297AF3EFC18D5CDFA2F683C52980AECF',
      source => 'https://www.virtualbox.org/download/oracle_vbox_2016.asc',
    }
  } 
#  package { "virtualbox-5.2":
#    ensure => installed
#  }

}

