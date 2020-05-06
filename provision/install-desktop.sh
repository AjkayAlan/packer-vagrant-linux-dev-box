#!/bin/zsh

# Install kde
sudo DEBIAN_FRONTEND=noninteractive apt-fast -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" install kde-plasma-desktop
