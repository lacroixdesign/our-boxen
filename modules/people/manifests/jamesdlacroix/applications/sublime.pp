class people::jamesdlacroix::applications::sublime {
  require people::jamesdlacroix::config

  include sublime_text

  $home = $people::jamesdlacroix::config::home
  $drop = $people::jamesdlacroix::config::dropbox_dir
  $sync = $people::jamesdlacroix::config::sync_dir

  $support_dir = "${home}/Library/Application Support/Sublime Text 3"
  $sync_dirs = [ "${sync}/SublimeText3",
                 "${sync}/SublimeText3/Packages",
                 "${sync}/SublimeText3/Installed Packages"
               ]

  file { $support_dir:
    ensure => "directory"
  }

  file { $sync_dirs:
    ensure => "directory"
  }

  file { "${support_dir}/Packages":
    ensure  => link,
    target  => "${sync}/SublimeText3/Packages",
    require => [ Package['Sublime Text'], File[$support_dir, $drop, $sync, $sync_dirs] ],
    force   => "true"
  }

  file { "${support_dir}/Installed Packages":
    ensure  => link,
    target  => "${sync}/SublimeText3/Installed Packages",
    require => [ Package['Sublime Text'], File[$support_dir, $drop, $sync, $sync_dirs] ],
    force   => "true"
  }
}
