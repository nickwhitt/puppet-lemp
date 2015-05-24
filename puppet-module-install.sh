#!/bin/bash
mkdir -p /etc/puppet/modules;

if [ ! -d /etc/puppet/modules/nginx ]; then
    puppet module install jfryman-nginx
fi

if [ ! -d /etc/puppet/modules/php ]; then
    puppet module install nodes/php
fi

if [ ! -d /etc/puppet/modules/mysql ]; then
    puppet module install puppetlabs-mysql
fi
