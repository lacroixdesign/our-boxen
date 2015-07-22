class config::node {
  include nodejs

  $node_version = 'iojs-2.4.0'

  class { 'nodejs::global':
    version => $node_version
  }

  nodejs::version { '0.12.7': }

  # npm modules

  npm_module { "bower for ${node_version}":
    module => 'bower',
    node_version => $node_version
  }
  npm_module { "gulp for ${node_version}":
    module => 'gulp',
    node_version => $node_version
  }
  npm_module { "eslint for ${node_version}":
    module => 'eslint',
    node_version => $node_version
  }
  npm_module { "eslint-plugin-babel for ${node_version}":
    module => 'eslint-plugin-babel',
    node_version => $node_version
  }
  npm_module { "eslint-plugin-react for ${node_version}":
    module => 'eslint-plugin-react',
    node_version => $node_version
  }
  npm_module { "babel-eslint for ${node_version}":
    module => 'babel-eslint',
    node_version => $node_version
  }
  # npm_module { "browser-sync for ${node_version}":
  #   module => 'browser-sync',
  #   node_version => $node_version
  # }
  npm_module { "jshint for ${node_version}":
    module => 'jshint',
    node_version => $node_version
  }
  npm_module { "uglify-js for ${node_version}":
    module => 'uglify-js',
    node_version => $node_version
  }
  npm_module { "grunt-cli for ${node_version}":
    module => 'grunt-cli',
    node_version => $node_version
  }
  # npm_module { "weinre for ${node_version}":
  #   module => 'weinre',
  #   node_version => $node_version
  # }
  npm_module { "svgo for ${node_version}":
    module => 'svgo',
    node_version => $node_version
  }

}
