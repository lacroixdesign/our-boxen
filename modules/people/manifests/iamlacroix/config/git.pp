class people::iamlacroix::config::git {

  git::config::global { 'user.name':
    value  => "Michael LaCroix"
  }

  git::config::global { 'user.email':
    value  => "michael@lacroixdesign.net"
  }

  git::config::global { 'core.editor':
    value  => "vim"
  }

  git::config::global { 'difftool "Kaleidoscope".cmd':
    value  => "ksdiff-wrapper git \\\"\$LOCAL\\\" \\\"\$REMOTE\\\""
  }

  git::config::global { 'mergetool.keepBackup':
    value  => "true"
  }

  git::config::global { 'push.default':
    value  => "simple"
  }

  git::config::global { 'alias.cc':
    value  => "commit"
  }

  git::config::global { 'alias.ss':
    value  => "status"
  }

  git::config::global { 'alias.co':
    value  => "checkout"
  }

  git::config::global { 'alias.rr':
    value  => "remote"
  }

  git::config::global { 'alias.rv':
    value  => "remote -v"
  }

  git::config::global { 'alias.hist':
    value  => "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
  }

  git::config::global { 'alias.logg':
    value  => "log --graph --decorate --abbrev-commit"
  }

  git::config::global { 'alias.lg':
    value  => "log --graph --pretty=format:'%C(magenta)%h%Creset -%C(bold green)%d%Creset %C(white)%s • %C(bold blue)(%cr)%Creset %C(yellow)<%an>%Creset' --abbrev-commit --date=relative"
  }

  git::config::global { 'alias.lgo':
    value  => "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
  }

  git::config::global { 'alias.lgs':
    value  => "log --graph --pretty=format:'%C(red)%C(black reverse magenta) %h %Creset%C(red)%d%Creset %C(yellow)%cr %C(bold blue)<%an>%Creset%C(bold white)%n%Creset          %s%n' --abbrev-commit --date=relative"
  }

  git::config::global { 'alias.kdiff':
    value  => "difftool -y -t Kaleidoscope"
  }
}
