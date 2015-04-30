# 5lovelanguages
class projects::innerworkings {
  require config::php

  $local_name = 'inwk'

  php::project { $local_name:
    source        => 'git@hyconnect.git.beanstalkapp.com:/hyconnect/innerworkings.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/wordpress-legacy.conf.erb',
    php           => $config::php::default_php,
  }
}
