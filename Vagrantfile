# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.ssh.forward_agent = true

  config.vm.provision "shell",
    inline: "echo \"General Shell Provisioning\""

  # Base - wakari -  VM definition
  config.vm.define "base", primary: true do |wakari|
        
    wakari.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--natnet1",  "192.168.2/24"]
    end

    wakari.vm.box = "Centos-6"
    wakari.vm.box_url = "https://binstar.org/bkreider/CentOS_6.4_x86_64_v20130427/1.0/files/526058e259466e6e55f6b072"

  end

end
