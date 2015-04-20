class people::iamlacroix::applications::atom_editor {
  require people::iamlacroix::config

  include atom

  $home = $people::iamlacroix::config::home
  $sync = $people::iamlacroix::config::dropbox_sync_dir

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
