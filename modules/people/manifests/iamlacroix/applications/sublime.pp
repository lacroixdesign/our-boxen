class people::iamlacroix::applications::sublime {
  require people::iamlacroix::config

  include sublime_text

  $home = $people::iamlacroix::config::home
  $drop = $people::iamlacroix::config::dropbox_dir
  $sync = $people::iamlacroix::config::dropbox_sync_dir

  $support_dir = "${home}/Library/Application Support/Sublime Text 3"
  $st_sync_dirs = [ "${sync}/SublimeText3",
                    "${sync}/SublimeText3/Packages",
                    "${sync}/SublimeText3/Installed Packages"
                  ]

  file { $support_dir:
    ensure => "directory"
  }

  file { $st_sync_dirs:
    ensure => "directory"
  }

  file { "${support_dir}/Packages":
    ensure  => link,
    target  => "${sync}/SublimeText3/Packages",
    require => [ Package['Sublime Text'], File[$support_dir, $drop, $sync, $st_sync_dirs] ],
    force   => "true"
  }

  file { "${support_dir}/Installed Packages":
    ensure  => link,
    target  => "${sync}/SublimeText3/Installed Packages",
    require => [ Package['Sublime Text'], File[$support_dir, $drop, $sync, $st_sync_dirs] ],
    force   => "true"
  }
}
