require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include brewcask
  include nginx
  include java
  include memcached
  include memcached::lib
  include elasticsearch
  include config::node
  include config::ruby
  include config::php
  include config::nginx
  include imagemagick

  # core apps & tools
  include chrome
  include firefox
  include iterm2::stable
  include virtualbox
  include heroku
  include sequel_pro

  # db
  include postgresql
  include mysql
  include mongodb

  # brewcasks
  package { 'markdown-service-tools': provider => 'brewcask' }
  package { 'qlstephen': provider => 'brewcask' }
  package { 'quicklook-json': provider => 'brewcask' }
  package { 'qlimagesize': provider => 'brewcask' }

  # vagrant
  class { 'vagrant':
    version => '1.6.5'
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
