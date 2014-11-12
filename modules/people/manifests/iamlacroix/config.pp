class people::iamlacroix::config {
  $home         = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"
  $dropbox_dir  = "${home}/Dropbox"
  $sync_dir     = "${dropbox_dir}/Sync"

  file { [$dropbox_dir, $sync_dir]:
    ensure => "directory"
  }

  include people::iamlacroix::config::shell
  include people::iamlacroix::config::git
  include people::iamlacroix::config::vim
}
