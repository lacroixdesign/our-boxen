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
  include nginx
  include java
  include memcached
  include memcached::lib
  include config::php
  include config::nginx
  include applications::docker
  include fig
  include imagemagick

  # core apps & tools
  include chrome
  include firefox
  include iterm2::stable
  include virtualbox
  include heroku

  include alfred
  include dropbox
  include bartender
  include sequel_pro

  # db
  include postgresql
  include mysql
  include mongodb

  # vagrant
  class { 'vagrant':
    version => '1.6.5'
  }

  # node
  include nodejs::v0_8
  include nodejs::v0_10

  $node_version = 'v0.10'
  class { 'nodejs::global':
    version => $node_version
  }

  nodejs::module { 'bower':     node_version => $node_version }
  nodejs::module { 'gulp':      node_version => $node_version }
  nodejs::module { 'jshint':    node_version => $node_version }
  nodejs::module { 'uglify-js': node_version => $node_version }
  nodejs::module { 'grunt-cli': node_version => $node_version }
  nodejs::module { 'weinre':    node_version => $node_version }

  # ruby
  $rb_version = "2.1.2"
  ruby::version { $rb_version: }
  ruby::version { '2.0.0': }
  ruby::version { '1.9.3': }

  ruby_gem { "bundler for ${version}":
    gem          => 'bundler',
    version      => '~> 1.7.0',
    ruby_version => '*',
  }
  ruby_gem { "foreman for ${version}":
    gem          => 'foreman',
    version      => '~> 0.75.0',
    ruby_version => $rb_version,
  }
  ruby_gem { "forward for ${version}":
    gem          => 'forward',
    version      => '~> 0.3.3',
    ruby_version => $rb_version,
  }
  ruby_gem { "scss-lint for ${version}":
    gem          => 'scss-lint',
    version      => '~> 0.29.0',
    ruby_version => $rb_version,
  }
  ruby_gem { "sass for ${version}":
    gem          => 'sass',
    version      => '~> 3.4.7',
    ruby_version => $rb_version,
  }
  ruby_gem { "cocoapods for ${version}":
    gem          => 'cocoapods',
    version      => '~> 0.34.4',
    ruby_version => $rb_version,
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
