class people::jamesdlacroix::applications::atom_editor {
  require people::jamesdlacroix::config

  include atom

  $home = $people::jamesdlacroix::config::home
  $sync = $people::jamesdlacroix::config::dropbox_sync_dir

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
