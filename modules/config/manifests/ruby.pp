class config::ruby {
  $rb_version = "2.2.0"
  ruby::version { $rb_version: }
  ruby::version { '2.1.5': }
  ruby::version { '2.0.0': }
  ruby::version { '1.9.3': }

  ruby_gem { "bundler for ${rb_version}":
    gem          => 'bundler',
    version      => '~> 1.7.0',
    ruby_version => '*',
  }
  ruby_gem { "foreman for ${rb_version}":
    gem          => 'foreman',
    version      => '~> 0.77.0',
    ruby_version => $rb_version,
  }
  ruby_gem { "forward for ${rb_version}":
    gem          => 'forward',
    version      => '~> 1.1.1',
    ruby_version => $rb_version,
  }
  ruby_gem { "scss-lint for ${rb_version}":
    gem          => 'scss-lint',
    version      => '~> 0.33.0',
    ruby_version => $rb_version,
  }
  ruby_gem { "sass for ${rb_version}":
    gem          => 'sass',
    version      => '~> 3.4.7',
    ruby_version => $rb_version,
  }
  ruby_gem { "premailer for ${rb_version}":
    gem          => 'premailer',
    version      => '~> 1.8.3',
    ruby_version => $rb_version,
  }
  ruby_gem { "nokogiri for ${rb_version}":
    gem          => 'nokogiri',
    version      => '~> 1.6.6.2',
    ruby_version => $rb_version,
  }
  ruby_gem { "cocoapods for ${rb_version}":
    gem          => 'cocoapods',
    version      => '~> 0.34.4',
    ruby_version => $rb_version,
  }

}
