class people::jamesdlacroix::applications::atom_editor {
  require people::jamesdlacroix::config

  include atom

  $home = $people::jamesdlacroix::config::home
  $sync = $people::jamesdlacroix::config::dropbox_sync_dir

  $dropbox_sync_dir = "${sync}/Atom"

  file { $dropbox_sync_dir:
    ensure => "directory"
  }

  file { "${home}/.atom":
    ensure  => link,
    target  => $dropbox_sync_dir,
    require => [ Package['Atom'], File[$dropbox_sync_dir] ],
    force   => "true"
  }
}
