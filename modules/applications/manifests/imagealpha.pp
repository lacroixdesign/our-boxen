class applications::imagealpha {
  package { 'ImageAlpha':
    provider => 'compressed_app',
    source   => 'http://pngmini.com/ImageAlpha1.3.5.tar.bz2'
  }
}
