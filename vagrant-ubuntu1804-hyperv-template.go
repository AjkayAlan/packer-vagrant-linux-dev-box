Vagrant.configure("2") do |config|
  config.vagrant.plugins = ["vagrant-env"]
  config.env.enable

  config.ssh.insert_key = {{.InsertKey}}

  config.vm.define "source", autostart: false do |source|
	  source.vm.box = "{{.SourceBox}}"
  end
  config.vm.define "output" do |output|
	  output.vm.box = "{{.BoxName}}"
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider :hyperv do |hyperv|
	  hyperv.memory = ENV["MEMORY"]
  	hyperv.maxmemory = ENV["MAX_MEMORY"]
  	hyperv.cpus = ENV["CPU_COUNT"]
  end

end