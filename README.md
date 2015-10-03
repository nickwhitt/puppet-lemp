# Puppet LEMP
Vagrant provisioner with Puppet.

Installs a LEMP stack for development environment:

- Ubuntu 14.04 Trusty Tahr 64-bit
- nginx
- MariaDB
- PHP-FPM

## Default Provisioner

### vagrant.app

Virtual host is configured to serve from the `/vagrant` directory.

### app Database

Root access is possible as `root:secret`, whereas the `app` database is created for `vagrant:vagrant`.

## Yii 2 Advanced Provisioner

Replace the `default.pp` puppet script with `yii2-advanced.pp`.

### frontend.dev

Virtual host is configured to serve from the `/vagrant/frontend/web` directory.

### backend.dev

Virtual host is configured to serve from the `/vagrant/backend/web` directory.

### app Database

Root access is possible as `root:secret`, whereas the `app` database is created for `vagrant:vagrant`.

## Hiera Configuration

Puppet can be configured with [Hiera](http://docs.puppetlabs.com/hiera/1/configuring.html), overriding the default
manifest with variables in `manifests/local.yaml`.
