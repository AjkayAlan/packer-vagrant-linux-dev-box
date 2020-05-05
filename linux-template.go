  
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
config.vm.provider :virtualbox do |vb|
	vb.default_nic_type = "virtio"
	vb.memory = ENV["MEMORY"]
	vb.cpus = ENV["CPU_COUNT"]
	vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
end

end