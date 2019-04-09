# desktop_config::apps::vim_orgmode

class desktop_config::apps::vim_orgmode {

	package{"vim-nox":
	  ensure => "present",
	}

  desktop_config::apps::pathogen_plugin {"vim-orgmode":
    git_url       => "https://github.com/jceb/vim-orgmode",
  }
  desktop_config::apps::pathogen_plugin {"speeddating":
    git_url       => "https://tpope.io/vim/speeddating",
  }
  desktop_config::apps::pathogen_plugin {"tagbar":
    git_url       => "https://github.com/majutsushi/tagbar",
  }
  desktop_config::apps::pathogen_plugin {"calendar-vim":
    git_url       => "git://github.com/mattn/calendar-vim",
  }
}

