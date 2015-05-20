class projects::clairediazortiz {
  require config::php

  $local_name = 'clairediazortiz'

  php::project { $local_name:
    source        => 'git@bitbucket.org:lacroixdesign/clairediazortiz.com.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/wordpress-legacy.conf.erb',
    php           => $config::php::default_php,
  }
}
