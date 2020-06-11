Vagrant.configure("2") do |config|
  config.ssh.insert_key = {{.InsertKey}}

  config.vm.define "source", autostart: false do |source|
	  source.vm.box = "{{.SourceBox}}"
  end
  config.vm.define "output" do |output|
	  output.vm.box = "{{.BoxName}}"
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true
end