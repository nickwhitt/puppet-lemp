hiera_include('classes')

nginx::resource::vhost { 'vagrant.app':
  www_root => hiera('nginx::www_root', '/vagrant'),
}

nginx::resource::location { 'vagrant_root':
  ensure        => present,
  vhost         => hiera('nginx::vhost', 'vagrant.app'),
  www_root      => hiera('nginx::www_root', '/vagrant'),
  location      => '~ \.php$',
  index_files   => ['index.php', 'index.html', 'index.htm'],
  fastcgi       => 'unix:/var/run/php5-fpm.sock',
  fastcgi_param => {
    'SCRIPT_FILENAME' => '$document_root/$fastcgi_script_name',
  },
}

class { 'timezone':
    timezone => hiera('timezone', 'UTC'),
}

class { '::mysql::server':
  package_name            => 'mariadb-server',
  root_password           => hiera('mysql::root_password', 'secret'),
  remove_default_accounts => hiera('mysql::remove_default_accounts', true),
}

class { '::mysql::client':
  package_name => 'mariadb-client',
}

class { '::mysql::bindings':
  php_enable => 'true',
}

mysql::db { 'app':
  dbname   => hiera('mysql::db', 'app'),
  user     => hiera('mysql::user', 'vagrant'),
  password => hiera('mysql::password', 'vagrant'),
}
