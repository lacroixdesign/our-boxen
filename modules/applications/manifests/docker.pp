class applications::docker {
  package { 'Boot2Docker':
    provider => 'pkgdmg',
    source   => 'https://github.com/boot2docker/osx-installer/releases/download/v1.3.2/Boot2Docker-1.3.2.pkg',
  }
}
