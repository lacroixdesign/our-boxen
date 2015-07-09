class projects::craft-gulp-boilerplate {
  require config::php

  $local_name = 'craft-gulp-boilerplate'

  php::project { $local_name:
    source        => "git@github.com:iamlacroix/${local_name}.git",
    dir           => "${boxen::config::srcdir}/_templates_/${local_name}",
    # Common defaults
    server_name   => "${local_name}.dev",
    # Stop editing
    nginx         => 'projects/shared/craft.conf.erb',
    php           => $config::php::default_php,
  }
}
