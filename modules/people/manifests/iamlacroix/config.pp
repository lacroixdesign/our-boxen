class people::iamlacroix::config {
  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  include people::iamlacroix::config::shell
  include people::iamlacroix::config::git
}
