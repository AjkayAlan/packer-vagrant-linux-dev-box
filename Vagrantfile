Vagrant.configure("2") do |config|
  config.vagrant.plugins = [
    "vagrant-env"
  ]
  config.env.enable

  config.vm.box = ENV['OUTPUT_BOX_NAME']
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.default_nic_type = "virtio"
    vb.memory = ENV['MEMORY']
    vb.cpus = ENV['CPU_COUNT']
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
  end
end