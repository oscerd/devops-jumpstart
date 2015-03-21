# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "xpeppers/devops-jumpstart"
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "1"
    vb.memory = "1024"
  end

  config.vm.define :development do |development|
    development.vm.network :forwarded_port, guest: 80, host: 8000
    development.vm.network "private_network", ip: "192.168.42.10"

    development.vm.provision :chef_zero, install: false  do |chef|
      chef.add_recipe "blog::default"
    end
  end

  config.vm.define :ci do |ci|
    ci.vm.network :forwarded_port, guest: 8080, host: 9000
    ci.vm.network "private_network", ip: "192.168.42.20"

    ci.vm.provision :chef_zero, install: false  do |chef|
      chef.add_recipe "blog::default"
      chef.add_recipe "ci::default"
    end
  end

  if Vagrant.has_plugin?("vagrant-triggers")
    config.trigger.before [:up, :reload], stdout: true do
      %w(development ci).each do |environment|
        `rm .vagrant/machines/#{environment}/virtualbox/synced_folders >> /dev/null 2>&1`
      end
    end
  end
end
