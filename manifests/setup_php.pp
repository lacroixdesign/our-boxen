class setup_php {
  $v55 = '5.5.13'
  $v54 = '5.4.29'

  include php::5_5_13
  include php::5_4_29
  include php::composer

  php::extension::memcached { "memcached for ${v55}": php => $v55 }
  php::extension::memcached { "memcached for ${v54}": php => $v54 }

  class { 'php::global':
    version => $v55
  }
}