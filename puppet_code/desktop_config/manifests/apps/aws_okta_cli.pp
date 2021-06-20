# desktop_config::apps::aws_okta_cli

class desktop_config::apps::aws_okta_cli {

  apt::source { 'segment_aws-okta':
    comment  => 'for the repository at https://packagecloud.io/segment/aws-okta',
    location => 'https://packagecloud.io/segment/aws-okta/debian/', 
    repos    => 'main',
    release  => 'stretch',
    include  => {
      'src' => true,
      'deb' => true,
    },
    key      => {
      'id'     => 'B446BAEA8B4D2AA43A3568AF0D90FFB9DBCA25A4',
      'source' => 'https://packagecloud.io/segment/aws-okta/gpgkey',
    },
  }

  # Need to update before trying to install aws-okta
  -> Class['apt::update']

  -> package{'aws-okta':
    ensure => 'present',
  }

  package{'awscli':
    ensure => 'present',
  }

  $aws_config_dir = "/home/${config_user}/.aws"

  file{'aws_config_dir':
    ensure => 'directory',
    path   => $aws_config_dir ,
  }

# export AWS_OKTA_BACKEND=file
  file{"${zshrc_dir}/aws_okta.zsh":
    content => file("${module_name}/aws_okta/aws_okta_rc"),
  }
  file{"${bashrc_dir}/aws_okta.sh":
    content => file("${module_name}/aws_okta/aws_okta_rc"),
  }

}
