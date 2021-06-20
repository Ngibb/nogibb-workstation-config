# desktop_config::apps::vscode
# code --help

class desktop_config::apps::vscode {

  # configure source for package
  apt::source {'vscode':
    comment      => 'vscode',
    architecture => 'amd64',
    location     => 'https://packages.microsoft.com/repos/vscode',
    release      => 'stable',
    repos        => 'main',
    key          => {
      id     => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
      source => 'https://packages.microsoft.com/keys/microsoft.asc',
    }
  }

  # Need to update before trying to install package 
  Class['apt::update']
  # install packages
  -> package {'code':
    ensure => 'present'
  }

  # set up config dir
  file {"/home/${config_user}/.vscode":
    ensure => 'directory',
  }

  # set up extension dir
  file {"/home/${config_user}/.vscode/extensions":
    ensure  => 'directory',
    require => File["/home/${config_user}/.vscode"],
  }

  desktop_config::apps::vscode_plugin {'vscodevim.vim':}
  desktop_config::apps::vscode_plugin {'puppet.puppet-vscode':}
  desktop_config::apps::vscode_plugin {'hashicorp.terraform':}

}
