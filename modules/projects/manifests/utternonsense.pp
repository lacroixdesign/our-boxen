class projects::utternonsense {
  require config::php

  $local_name = 'utternonsensegame'

  php::project { $local_name:
    source        => 'git@github.com:lacroixdesign/utternonsensegame.com.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.craft.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/craft.conf.erb',
    php           => $config::php::default_php,
  }
}
