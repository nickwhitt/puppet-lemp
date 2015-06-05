class { ['nginx', 'php::fpm', 'php::cli', 'php::extension::gd', 'php::extension::xdebug']: }

nginx::resource::vhost { 'vagrant.app':
  www_root => '/vagrant',
}

nginx::resource::location { 'vagrant_root':
  ensure        => present,
  vhost         => 'vagrant.app',
  www_root      => '/vagrant',
  location      => '~ \.php$',
  index_files   => ['index.php', 'index.html', 'index.htm'],
  fastcgi       => 'unix:/var/run/php5-fpm.sock',
  fastcgi_param => {
    'SCRIPT_FILENAME' => '$document_root/$fastcgi_script_name',
  },
}

class { 'timezone':
    timezone => 'America/New_York',
}

class { '::mysql::server':
  package_name            => 'mariadb-server',
  root_password           => 'secret',
  remove_default_accounts => true,
}

class { '::mysql::client':
  package_name => 'mariadb-client',
}

class { '::mysql::bindings':
  php_enable => 'true',
}

mysql::db { 'app':
  user     => 'vagrant',
  password => 'vagrant',
}
