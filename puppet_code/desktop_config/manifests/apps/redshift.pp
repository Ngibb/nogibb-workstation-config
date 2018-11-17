# desktop_config::apps::redshift

class desktop_config::apps::redshift(
                   $config_file_path = "${config_user_home_dir}/.config/redshift.conf",
  Integer          $temp_day         = 5700,
  Integer          $temp_night       = 5700,
  Float[0, 1]      $gamma_day        = 0.8,
  Float[0, 1]      $gamma_night      = 0.8,
  Float[0, 1]      $brightness_day   = 0.7,
  Float[0, 1]      $brightness_night = 0.4,
  Float[-90, 90]   $latitude         = 47.620,
  Float[-180, 180] $longitude        = -122.4,
  NotUndef[Enum["manual","geoclue","geoclue2"]] $location_provider = geoclue2,
){

  package { "redshift":
    ensure => installed
  }

  #package { "redshift-gtk":
  #  ensure => installed
  #}

  file {"${config_file_path}":
    content => template("${module_name}/redshift.conf.erb"),
  }

}

