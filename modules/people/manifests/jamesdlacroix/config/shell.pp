class people::jamesdlacroix::config::shell {
  require people::jamesdlacroix::config

  include zsh
  include ohmyzsh

  repository { $people::jamesdlacroix::config::dotfiles_dir:
    source => "iamlacroix/dotfiles"
  }

  # connect dotfiles
  file { "${people::jamesdlacroix::config::home}/.zshenv":
    path    => "${people::jamesdlacroix::config::home}/.zshenv",
    ensure  => present,
    mode    => 0640,
    content => "export DOTFILES=\"${people::jamesdlacroix::config::dotfiles_dir}\"\nsource \$DOTFILES/zsh/zshenv.zsh\n",
    require => Repository[$people::jamesdlacroix::config::dotfiles_dir]
  }

  file { "${people::jamesdlacroix::config::home}/.zshrc":
    path    => "${people::jamesdlacroix::config::home}/.zshrc",
    ensure  => present,
    mode    => 0640,
    content => "source \$DOTFILES/zsh/zshrc.zsh\n",
    require => Repository[$people::jamesdlacroix::config::dotfiles_dir]
  }
}
