class projects::craft-webpack-boilerplate {
  require config::php

  $local_name = 'craft-webpack-boilerplate'

  php::project { $local_name:
    source        => "git@github.com:iamlacroix/${local_name}.git",
    dir           => "${boxen::config::srcdir}/_templates_/${local_name}",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "craftboilerplate_dev",
    # Stop editing
    nginx         => 'projects/shared/craft.conf.erb',
    php           => $config::php::default_php,
  }
}
