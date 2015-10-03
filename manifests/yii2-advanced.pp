hiera_include('classes')

nginx::resource::vhost { 'frontend.dev':
  www_root  => '/vagrant/frontend/web',
  try_files => ['$uri $uri/ /index.php?$args'],
}

nginx::resource::location { 'frontend':
  ensure        => present,
  vhost         => 'frontend.dev',
  www_root      => '/vagrant/frontend/web',
  location      => '~ \.php$',
  index_files   => ['index.php', 'index.html', 'index.htm'],
  fastcgi       => 'unix:/var/run/php5-fpm.sock',
  fastcgi_param => {
    'SCRIPT_FILENAME' => '$document_root/$fastcgi_script_name',
  },
}

nginx::resource::vhost { 'backend.dev':
  www_root  => '/vagrant/backend/web',
  try_files => ['$uri $uri/ /index.php?$args'],
}

nginx::resource::location { 'backend':
  ensure        => present,
  vhost         => 'backend.dev',
  www_root      => '/vagrant/backend/web',
  location      => '~ \.php$',
  index_files   => ['index.php', 'index.html', 'index.htm'],
  fastcgi       => 'unix:/var/run/php5-fpm.sock',
  fastcgi_param => {
    'SCRIPT_FILENAME' => '$document_root/$fastcgi_script_name',
  },
}

mysql::db { 'yii2advanced':
  user     => 'vagrant',
  password => 'vagrant',
}
