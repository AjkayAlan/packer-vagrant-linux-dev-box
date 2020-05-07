Vagrant.configure("2") do |config|
  config.ssh.insert_key = {{.InsertKey}}

  config.vm.define "source", autostart: false do |source|
	  source.vm.box = "{{.SourceBox}}"
  end
  config.vm.define "output" do |output|
	  output.vm.box = "{{.BoxName}}"
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :virtualbox do |vb|
	  vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
	  vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
  end
end