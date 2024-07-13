Vagrant.configure("2") do |config|

  config.vm.box = "kalilinux/rolling"
  config.vm.box_version = "2024.2.0"

  # Network settings
  #config.vm.network "private_network", type: "dhcp"

  # Configuration for VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  # Configuration for VMware Fusion
  config.vm.provider "vmware_fusion" do |vf|
    vf.memory = "2048"
    vf.cpus = 2
  end

  # Provisioning
  config.vm.provision :shell do |shell|
    shell.path = "provision.sh"
  end

end