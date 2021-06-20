# desktop_config::apps::pathogen_plugin

define desktop_config::apps::vscode_plugin(
  $extension_id = $name
){

  exec {"vscode_plugin_install_${extension_id}":
    command => "code --install-extension ${extension_id}",
    user    => "${config_user}",
    unless  => "code --list-extensions --show-versions | grep -q \"${extension_id}\"",
    cwd     => '/tmp/',
    path    => '/bin/:/usr/bin:/user/bin/code',
    require => [File["/home/${config_user}/.vscode/extensions"], Package['code']]
  }
}
