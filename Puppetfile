# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.7.0"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.0"
github "go",          "1.1.0"
github "homebrew",    "1.9.8"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.8.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.5"
github "stdlib",      "4.4.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "osx",           "2.7.1"
github "sysctl",        "1.0.1"
github "wget",          "1.0.1"
github "autoconf",      "1.0.0"
github "libtool",       "1.0.0"
github "java",          "1.7.1"
github "android",       "1.3.0"
github "pcre",          "1.0.0"
github "libpng",        "1.0.0"
github "php",           "1.2.6"
github "fonts",         "0.0.3"
github "postgresql",    "3.0.1"
github "mysql",         "1.99.18"
github "mongodb",       "1.3.3"
github "memcached",     "1.4.0", :repo => "mattheath/puppet-memcached"
github "imagemagick",   "1.3.0"

# Apps & Tools

github "iterm2",        "1.2.2"
github "zsh",           "1.0.0"
github "ohmyzsh",       "1.0.0", :repo => "erivello/puppet-ohmyzsh"
github "chrome",        "1.2.0"
github "firefox",       "1.2.3"
github "virtualbox",    "1.0.13"
github "heroku",        "2.1.1"
github "vagrant",       "3.2.0"
github "alfred",        "1.3.1"
github "bartender",     "1.0.0"
github "dropbox",       "1.4.1"
github "imageoptim",    "0.0.2"

github "atom",                "1.0.0"
github "sublime_text",        "1.0.2"
github "rubymine",            "1.1.0"
github "transmit",            "1.0.2"
github "sequel_pro",          "1.0.1"
github "skype",               "1.0.9"
github "github_for_mac",      "1.0.3"
github "fluid",               "1.0.2"
github "notational_velocity", "1.1.2"
github "marked2",             "1.1.0", :repo => "iamlacroix/puppet-marked2"
