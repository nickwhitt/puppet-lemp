hiera_include('classes')

nginx::resource::vhost { 'vagrant.app':
  www_root  => '/vagrant',
  try_files => ['$uri $uri/ /index.php?$args'],
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

mysql::db { 'app':
  user     => 'vagrant',
  password => 'vagrant',
}
