class projects::startmarriageright {
  require config::php

  $local_name = 'startmarriageright'
  $version = $config::php::default_php

  php::project { $local_name:
    source        => 'git@bitbucket.org:lacroixdesign/start-marriage-right.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/wordpress.conf.erb',
    php           => $version,
  }

  php::fpm::pool { "${local_name}-${version}":
    version     => $version,
    socket_path => "${boxen::config::socketdir}/${local_name}",
    require     => File["${nginx::config::sitesdir}/${local_name}.conf"],
  }
}
