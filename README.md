# packer-vagrant-ubuntu1804-dev-box
Creates a base developer box with Packer that can be extended upon. Installs a gui, some nice IDE's, and a fair bit of programming languages.

## Computer Setup

1. Install Hyper-V (by running the following in an admin PowerShell session):
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

2. Install Vagrant (via Chocolatey):
```
choco install vagrant
```

3. Install Packer (via Chocolatey):
```
choco install packer
```

# Building Using Packer
CD to the repo root, and then use packer!:
```
packer build .\vagrant-ubuntu1804-hyperv.json
```