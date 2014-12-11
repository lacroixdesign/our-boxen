class people::iamlacroix::config {
  $home         = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"
  $dropbox_dir  = "${home}/Dropbox"
  $sync_dir     = "${dropbox_dir}/Sync"

  file { $dropbox_dir:
    ensure => "directory"
  }

  file { $sync_dir:
    ensure  => "directory",
    require => File[$dropbox_dir]
  }

  include people::iamlacroix::config::shell
  include people::iamlacroix::config::git
  include people::iamlacroix::config::vim
  include people::iamlacroix::config::osx
}
