class people::iamlacroix::applications::atom_editor {
  require people::iamlacroix::config

  include atom

  $home = $people::iamlacroix::config::home
  $sync = $people::iamlacroix::config::gdrive_sync_dir

  $atom_sync_dir = "${sync}/Atom"

  file { $atom_sync_dir:
    ensure => "directory"
  }

  file { "${home}/.atom":
    ensure  => link,
    target  => $atom_sync_dir,
    require => [ Package['Atom'], File[$atom_sync_dir] ],
    force   => "true"
  }
}
