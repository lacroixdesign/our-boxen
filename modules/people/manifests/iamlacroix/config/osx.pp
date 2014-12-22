class people::iamlacroix::config::osx {
  require people::iamlacroix::config

  exec { 'killall SystemUIServer':
    command => "/usr/bin/killall SystemUIServer",
    refreshonly => true
  }

  # Change screenshots directory

  $dropbox_dir     = "${people::iamlacroix::config::dropbox_dir}"
  $dropbox_img_dir = "${dropbox_dir}/Images"
  $screenshots_dir = "${dropbox_img_dir}/Screenshots"

  file { $dropbox_img_dir:
    ensure  => "directory",
    require => File[$dropbox_dir]
  }

  file { $screenshots_dir:
    ensure  => "directory",
    require => File[$dropbox_img_dir]
  }

  boxen::osx_defaults { "change osx screenshots location to ${screenshots_dir}":
    domain  => 'com.apple.screencapture',
    key     => 'location',
    type    => 'string',
    value   => $screenshots_dir,
    user    => $::boxen_user,
    notify  => Exec['killall SystemUIServer'],
    require => File[$screenshots_dir]
  }
}
