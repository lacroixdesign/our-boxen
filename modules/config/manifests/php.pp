class config::php {
  include php::composer
  require config::php_version

  $v7 = $config::php_version::v7
  # $default_php = '7.0.6'

  php::fpm { "${v7}": }
  php::extension::mcrypt { "mcrypt for ${v7}": php => $v7 }

  # php::extension::memcached { "memcached for ${v7}":
  #   php     => $v7,
  #   version => '2.2.0'
  # }

  # $v55 = '5.5.30'
  # # $v7 = '7.0.0'
  #
  # $default_php = $v55
  #
  # include php::composer
  #
  # php::fpm { "${v55}": }
  #
  # php::extension::memcached { "memcached for ${v55}":
  #   php     => $v55,
  #   version => '2.2.0'
  # }
  # php::extension::mcrypt { "mcrypt for ${v55}": php => $v55 }
  #
  # # php::extension::memcached { "memcached for ${v7}":
  # #   php     => $v7,
  # #   version => '2.2.0'
  # # }
  # # php::extension::mcrypt { "mcrypt for ${v7}": php => $v7 }
}
