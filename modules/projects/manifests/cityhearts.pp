class projects::cityhearts {
  require config::php

  $local_name = 'cityheartschicago'

  php::project { $local_name:
    source        => 'git@bitbucket.org:lacroixdesign/city-hearts.git',
    dir           => "${boxen::config::srcdir}/${local_name}.org",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/craft.conf.erb',
    php           => $config::php::default_php,
  }
}
