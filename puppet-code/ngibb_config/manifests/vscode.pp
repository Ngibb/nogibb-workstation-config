# ngibb_config::vscode
# code --help

class ngibb_config::vscode {

  apt::source {'vscode':
    comment      => 'microsoft',
    architecture => 'amd64',
    location     => 'https://packages.microsoft.com/repos/vscode',
    release      => 'stable',
    repos        => 'main',
 #   key          => {
 #     'id '    => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
 #     'source' => 'https://packages.microsoft.com/keys/microsoft.asc',
 #   }
  }
  
  package {"code":
    ensure => "present"
  }

  file {"/home/${config_user}/.vscode":
    ensure => "directory",
  }

  file {"/home/${config_user}/.vscode/extensions":
    ensure => "directory",
    require => File["/home/${config_user}/.vscode"],
  }

  # vim key bindings
  exec {"vscode_vim_plugin":
    command  => "code --install-extension vscodevim.vim",
    user     => "${config_user}",
    unless   => "code --list-extensions --show-versions | grep -q 'vscodevim'",
    cwd      => "/tmp/",
    path     => "/bin/:/usr/bin:/user/bin/code",
    require  => File["/home/${config_user}/.vscode/extensions"],
  }


}

