class projects::appreciationatwork {
  require config::php

  $local_name = 'appreciationatwork'

  php::project { $local_name:
    source        => 'git@bitbucket.org:lacroixdesign/appreciation-at-work.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/wordpress.conf.erb',
    php           => $config::php::default_php,
  }
}
