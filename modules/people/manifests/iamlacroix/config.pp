class people::iamlacroix::config {
  $home         = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"
  $dropbox_dir  = "${home}/Dropbox (Personal)"
  $googledrive_dir  = "${home}/Google Drive"
  $dropbox_sync_dir = "${dropbox_dir}/Sync"
  $gdrive_sync_dir  = "${googledrive_dir}/Sync"

  file { [$dropbox_dir, $googledrive_dir]:
    ensure => "directory"
  }

  file { $dropbox_sync_dir:
    ensure  => "directory",
    require => File[$dropbox_dir]
  }

  file { $gdrive_sync_dir:
    ensure  => "directory",
    require => File[$googledrive_dir]
  }

  include people::iamlacroix::config::shell
  include people::iamlacroix::config::git
  include people::iamlacroix::config::vim
  include people::iamlacroix::config::osx
}
