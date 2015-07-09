class projects::crafttest {
  require config::php

  $local_name = 'crafttest'

  php::project { $local_name:
    source        => 'git@github.com:iamlacroix/craft-gulp-boilerplate.git',
    dir           => "${boxen::config::srcdir}/_tools_/test.craft.dev",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "craft_test",
    # Stop editing
    nginx         => 'projects/shared/craft.conf.erb',
    php           => $config::php::default_php,
  }
}
