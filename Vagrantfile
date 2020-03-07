Vagrant.configure("2") do |config|
  config.vagrant.plugins = [
    "vagrant-env"
  ]
  config.env.enable

  config.vm.box = ENV['OUTPUT_BOX_NAME']
  config.vm.network ENV['NETWORK_IDENTIFIER'], bridge: ENV['BRIDGE_NAME']
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :hyperv do |hyperv|
    hyperv.vmname = ENV['OUTPUT_BOX_NAME']
    hyperv.memory = ENV['MEMORY']
    hyperv.maxmemory = ENV['MAX_MEMORY']
    hyperv.cpus = ENV['CPU_COUNT']
  end
end