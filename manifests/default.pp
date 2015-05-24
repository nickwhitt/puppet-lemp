exec { 'apt-update':
    command => '/usr/bin/apt-get update'
}

package { 'nginx':
  require => Exec['apt-update'],
  ensure => installed,
}

service { 'nginx':
    ensure => running,
}

package { 'php5-fpm':
  require => Exec['apt-update'],
  ensure => installed,
}

file { '/etc/nginx/sites-available/default':
    ensure => present,
    source => '/vagrant/manifests/nginx_default',
    require => Package['nginx'],
    notify => Service['nginx'],
}
