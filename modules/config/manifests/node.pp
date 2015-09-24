class config::node {
  include nodejs

  $v = '4.0.0'

  class { 'nodejs::global':
    version => $v
  }

  nodejs::version { '0.12.7': }

  # npm modules

  npm_module { "babel for Node ${v}": module => 'babel', node_version => $v }
  npm_module { "babel-eslint for Node ${v}": module => 'babel-eslint', node_version => $v }
  npm_module { "bower for Node ${v}": module => 'bower', node_version => $v }
  npm_module { "datauri for Node ${v}": module => 'datauri', node_version => $v }
  npm_module { "ember-cli for Node ${v}": module => 'ember-cli', node_version => $v }
  npm_module { "eslint for Node ${v}": module => 'eslint', node_version => $v }
  npm_module { "eslint-plugin-babel for Node ${v}": module => 'eslint-plugin-babel', node_version => $v }
  npm_module { "eslint-plugin-react for Node ${v}": module => 'eslint-plugin-react', node_version => $v }
  npm_module { "gulp for Node ${v}": module => 'gulp', node_version => $v }
  npm_module { "grunt-cli for Node ${v}": module => 'grunt-cli', node_version => $v }
  npm_module { "jshint for Node ${v}": module => 'jshint', node_version => $v }
  npm_module { "nodemon for Node ${v}": module => 'nodemon', node_version => $v }
  npm_module { "svgo for Node ${v}": module => 'svgo', node_version => $v }
  npm_module { "uglify-js for Node ${v}": module => 'uglify-js', node_version => $v }
  npm_module { "yo for Node ${v}": module => 'yo', node_version => $v }

}
