Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "./", "/vagrant", owner: "vagrant", group: "www-data", mount_options: ["dmode=775", "fmode=775"]

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus   = 2
  end

  config.vm.provision "shell", path: "apt-update.sh"
  config.vm.provision "shell", path: "puppet-module-install.sh"

  config.vm.provision :puppet do |puppet|
    puppet.hiera_config_path = "hiera.yaml"
  end

end
