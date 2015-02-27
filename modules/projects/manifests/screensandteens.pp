# screensandteens
class projects::screensandteens {
  require config::php

  $local_name = 'screensandteens'

  php::project { $local_name:
    source        => 'git@bitbucket.org:lacroixdesign/screensandteens.com.git',
    dir           => "${boxen::config::srcdir}/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/wordpress.conf.erb',
    php           => $config::php::default_php,
  }
}
