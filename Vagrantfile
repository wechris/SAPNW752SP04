# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "openSUSE-15.1"
  config.vm.hostname = "vhcalnplci"
  config.vm.box_url = "./packer/openSUSE-Leap-15.1/openSUSE-15.1-virtualbox.box"

  # config.vm.box = "wechris/openSUSE-42.3"
  # config.vm.hostname = "vhcalnplci"
  # config.vm.box_version = "1.0.0"
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
   config.vm.network "forwarded_port", guest: 8000, host: 8000, id: "http", auto_correct: true
   config.vm.network "forwarded_port", guest: 44300, host: 44300, id: "https", auto_correct: true
   config.vm.network "forwarded_port", guest: 3300, host: 3300, id: "rfc", auto_correct: true
   config.vm.network "forwarded_port", guest: 3200, host: 3200, id: "sapgui", auto_correct: true
   config.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", auto_correct: true
   #config.vm.network "forwarded_port", guest: 3306, host: 3603

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
   
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "", "/vagrant", :owner => "vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
    vb.name = "SAPNetWeaver7.52SP04"
    vb.gui = true
    vb.linked_clone = true
    
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "8192", "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    vb.customize ["modifyvm", :id, "--vram", "32"]
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  # Installations###
  # Comment the line to not to install some tool. ###
  # These tools are not optional. They are used by the others installations scripts.
   config.vm.provision "shell", path: "install/uuidd.sh"
  
   config.vm.provision "shell", path: "install/changetogerman.sh"
  
   config.vm.provision "shell", path: "install/sapinst.sh"

   config.vm.provision "shell", path: "install/gnome.sh"

end
