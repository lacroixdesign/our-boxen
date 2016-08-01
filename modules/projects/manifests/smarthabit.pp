class projects::smarthabit {
  require config::php

  php::project { $local_name:
    source        => 'git@github.com:lacroixdesign/smarthabit-manage.git',
    dir           => "${boxen::config::srcdir}/SmartHabit/backend.smarthabit.com",
    # Common defaults
    server_name   => "smarthabit.dev",
    mysql         => "smarthabit_dev",
    # Stop editing
    nginx         => 'projects/shared/craft.conf.erb',
    php           => $config::php::default_php,
  }
}
