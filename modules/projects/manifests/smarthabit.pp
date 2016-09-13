class projects::smarthabit {
  require config::php_version

  $local_name = 'smarthabit'

  php::project { $local_name:
    source        => 'git@github.com:lacroixdesign/smarthabit-manage.git',
    dir           => "${boxen::config::srcdir}/SmartHabit/backend.smarthabit.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/craft.conf.erb',
    php           => $config::php_version::default,
  }
}
