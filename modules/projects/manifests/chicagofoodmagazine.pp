class projects::chicagofoodmagazine {
  require config::php

  $local_name = 'chicagofoodmagazine'

  php::project { $local_name:
    source        => 'git@bitbucket.org:lacroixdesign/chicago-food-magazine.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/craft.conf.erb',
    php           => $config::php::default_php,
  }
}
