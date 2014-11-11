class people::iamlacroix::config::vim {
  require people::iamlacroix::config

  $vim_dir = "${people::iamlacroix::config::home}/.vim"
  $bundle_dir = "${vim_dir}/bundle"
  $vundle_dir = "${bundle_dir}/Vundle.vim"

  file { [$vim_dir, $bundle_dir]:
    ensure   => 'directory',
  } ->

  repository { $vundle_dir:
    source  => 'https://github.com/gmarik/Vundle.vim',
    notify  => Exec['BundleInstall'],
  } ->

  exec { 'BundleInstall':
    command     => 'vim +PluginInstall +qall',
    subscribe   => Repository[$vundle_dir],
    refreshonly => true,
    path        => $::path,
  }
}
