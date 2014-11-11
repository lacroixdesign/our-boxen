class people::iamlacroix::config::shell {
  require people::iamlacroix::config

  include zsh
  include ohmyzsh

  repository { $people::iamlacroix::config::dotfiles_dir:
    source => "${::github_login}/dotfiles"
  }

  # connect dotfiles
  file { "${people::iamlacroix::config::home}/.zshenv":
    path    => "${people::iamlacroix::config::home}/.zshenv",
    ensure  => present,
    mode    => 0640,
    content => "export DOTFILES=\"${people::iamlacroix::config::dotfiles_dir}\"\nsource \$DOTFILES/zsh/zshenv.zsh\n",
    require => Repository[$people::iamlacroix::config::dotfiles_dir]
  }

  file { "${people::iamlacroix::config::home}/.zshrc":
    path    => "${people::iamlacroix::config::home}/.zshrc",
    ensure  => present,
    mode    => 0640,
    content => "source \$DOTFILES/zsh/zshrc.zsh\n",
    require => Repository[$people::iamlacroix::config::dotfiles_dir]
  }
}
