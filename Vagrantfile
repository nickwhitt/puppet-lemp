Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision "shell", path: "apt-update.sh"
  config.vm.provision "shell", path: "puppet-module-install.sh"

  config.vm.provision :puppet

end
