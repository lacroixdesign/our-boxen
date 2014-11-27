class config::nginx {
  include nginx

  $config_dir  = $nginx::config::sitesdir
  $template    = 'config/forward.conf'
  $config_file = "${config_dir}/_dev_forwarding.conf"

  file { $config_file:
    content => template($template),
    require => File[$config_dir],
    notify  => Service['dev.nginx'],
  }
}
