class { ['nginx', 'php::fpm', 'php::cli']: }

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
