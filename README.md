# Puppet LEMP
Vagrant provisioner with Puppet.

Installs a LEMP stack for development environment:

- Ubuntu 14.04 Trusty Tahr 64-bit
- nginx
- MariaDB
- PHP-FPM

## vagrant.app

Virtual host configuration is automatically configured to serve from the `/vagrant` directory.

## app Database

Root access is possible as `root:secret`, whereas the `app` database is created for `vagrant:vagrant`.
