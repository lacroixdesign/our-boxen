class people::iamlacroix::applications {
  require people::iamlacroix::config

  include sublime_text
  include cloudapp
  include transmit
  include skype

  $home = $people::iamlacroix::config::home

  $st3_support_dir = "${home}/Library/Application Support/Sublime Text 3"
  $st3_sync_dirs = [ "${home}/Dropbox/",
                     "${home}/Dropbox/Sync",
                     "${home}/Dropbox/Sync/SublimeText3",
                     "${home}/Dropbox/Sync/SublimeText3/Packages",
                     "${home}/Dropbox/Sync/SublimeText3/Installed Packages"
                   ]

  file { $st3_support_dir:
    ensure => "directory"
  }

  file { $st3_sync_dirs:
    ensure => "directory"
  }

  file { "${st3_support_dir}/Packages":
    ensure  => link,
    target  => "${home}/Dropbox/Sync/SublimeText3/Packages",
    require => [Package['Sublime Text'], File[$st3_support_dir, $st3_sync_dirs] ],
    force   => "true"
  }

  file { "${st3_support_dir}/Installed Packages":
    ensure  => link,
    target  => "${home}/Dropbox/Sync/SublimeText3/Installed Packages",
    require => [Package['Sublime Text'], File[$st3_support_dir, $st3_sync_dirs] ],
    force   => "true"
  }
}
