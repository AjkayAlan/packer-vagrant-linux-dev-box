#!/bin/zsh

# Install PowerShell Core and make it available
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell

# Cleanup
rm packages-microsoft-prod.deb
