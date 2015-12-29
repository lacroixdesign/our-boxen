class config::nginx {
  include nginx

  $config_dir = $nginx::config::sitesdir

  file { "${config_dir}/_dev_forwarding.conf":
    content => template('config/forward.conf'),
    require => File[$config_dir],
    notify  => Service['dev.nginx'],
  }

  file { "${config_dir}/_dev_docker.conf":
    content => template('config/docker.conf'),
    require => File[$config_dir],
    notify  => Service['dev.nginx'],
  }
}
