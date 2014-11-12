class people::iamlacroix::applications::atom_editor {
  require people::iamlacroix::config

  include atom

  $home = $people::iamlacroix::config::home
  $sync = $people::iamlacroix::config::sync_dir

  $sync_dir = "${sync}/Atom"

  file { $sync_dir:
    ensure => "directory"
  }

  file { "${home}/.atom":
    ensure  => link,
    target  => $sync_dir,
    require => [ Package['Atom'], File[$sync_dir] ],
    force   => "true"
  }
}
