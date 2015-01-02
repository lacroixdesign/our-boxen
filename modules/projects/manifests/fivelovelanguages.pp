# 5lovelanguages
class projects::fivelovelanguages {
  require config::php

  $local_name = '5lovelanguages'

  php::project { $local_name:
    source        => 'git@bitbucket.org:lacroixdesign/5lovelanguages.com.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/wordpress.conf.erb',
    php           => $config::php::default_php,
  }
}