# desktop_config::apps::vim

class desktop_config::apps::pathogen_vim {

  file {"/home/${config_user}/.vim/autoload/":
    ensure => directory,
  }

  file {"/home/${config_user}/.vim/bundle/":
    ensure => directory,
  }

  exec {"install_pathogen":
    user    => $config_user,
    command => "/usr/bin/curl -LSso /home/${config_user}/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim",
    require => File["/home/${config_user}/.vim/autoload/"],
    creates => "/home/${config_user}/.vim/autoload/pathogen.vim",
  }

  desktop_config::apps::pathogen_plugin {"vim-terraform":
    git_url       => "https://github.com/hashivim/vim-terraform.git",
  }
  desktop_config::apps::pathogen_plugin {"vim-puppet":
    git_url       => "https://github.com/rodjek/vim-puppet.git",
  }
  desktop_config::apps::pathogen_plugin {"vim-airline":
    git_url       => "https://github.com/vim-airline/vim-airline",
  }
}

