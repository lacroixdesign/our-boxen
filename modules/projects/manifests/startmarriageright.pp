class projects::startmarriageright {
  require config::php

  $local_name = 'startmarriageright'

  php::project { $local_name:
    source        => 'git@bitbucket.org:lacroixdesign/start-marriage-right.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/wordpress.conf.erb',
    php           => $config::php::default_php,
  }
}
