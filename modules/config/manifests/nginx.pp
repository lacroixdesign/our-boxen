class config::nginx {
  include nginx

  $config_dir = $nginx::config::sitesdir

  $fwd_template = 'config/forward.conf'
  $fwd_config   = "${config_dir}/_dev_forwarding.conf"

  $docker_template = 'config/docker.conf'
  $docker_config   = "${config_dir}/_dev_docker.conf"

  file { $fwd_config:
    content => template($fwd_template),
    require => File[$config_dir],
    notify  => Service['dev.nginx'],
  }

  file { $docker_config:
    content => template($docker_template),
    require => File[$config_dir],
    notify  => Service['dev.nginx'],
  }
}
