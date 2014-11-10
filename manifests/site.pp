require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    # "${boxen::config::home}/rbenv/shims",
    # "${boxen::config::home}/rbenv/bin",
    # "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
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

  include chrome
  include firefox
  include iterm2::stable
  include zsh
  include ohmyzsh
  include sublime_text
  include virtualbox
  include alfred
  include bartender

  # fail if FDE is not enabled
  #if $::root_encrypted == 'no' {
  #  fail('Please enable full disk encryption and try again')
  #}

  # node versions
  #include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  class { 'nodejs::global':
    version => 'v0.10'
  }

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.2': }

  $version = "2.1.2"
  ruby_gem { "bundler for ${version}":
    gem          => 'bundler',
    version      => '~> 1.7.0',
    ruby_version => $version,
  }
  ruby_gem { "foreman for ${version}":
    gem          => 'foreman',
    version      => '~> 0.75.0',
    ruby_version => $version,
  }
  ruby_gem { "forward for ${version}":
    gem          => 'forward',
    version      => '~> 0.3.3',
    ruby_version => $version,
  }
  ruby_gem { "scss-lint for ${version}":
    gem          => 'scss-lint',
    version      => '~> 0.29.0',
    ruby_version => $version,
  }
  ruby_gem { "sass for ${version}":
    gem          => 'sass',
    version      => '~> 3.4.7',
    ruby_version => $version,
  }
  ruby_gem { "cocoapods for ${version}":
    gem          => 'cocoapods',
    version      => '~> 0.34.4',
    ruby_version => $version,
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
