# abidinglife
class projects::abidinglife {
  require config::php

  $local_name = 'abidinglife'

  php::project { $local_name:
    source        => 'lacroixdesign/abidinglife.com',
    dir           => "${boxen::config::srcdir}/AbidingLife/${local_name}.com",
    # Common defaults
    server_name   => "${local_name}.dev",
    mysql         => "${local_name}_dev",
    # Stop editing
    nginx         => 'projects/shared/wordpress.conf.erb',
    php           => $config::php::default_php,
  }
}
