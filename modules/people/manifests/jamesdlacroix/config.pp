class people::jamesdlacroix::config {
  $home         = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"
  $dropbox_dir  = "${home}/Dropbox"
  $sync_dir     = "${dropbox_dir}/Sync"

  file { [$dropbox_dir, $sync_dir]:
    ensure => "directory"
  }

  include people::jamesdlacroix::config::shell
  include people::jamesdlacroix::config::git
  include people::jamesdlacroix::config::vim
}
