class projects::margaux {
  boxen::project { 'margaux':
    source => 'BuildRX/Margaux',
    dir    => "${boxen::config::srcdir}/margauxny.com"
  }
}
