class people::jamesdlacroix::applications::atom_editor {
  require people::jamesdlacroix::config

  include atom

  $home = $people::jamesdlacroix::config::home
  $sync = $people::jamesdlacroix::config::sync_dir

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
