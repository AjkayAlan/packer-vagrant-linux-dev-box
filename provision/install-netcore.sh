#!/bin/zsh

# Install .NET Core and make it available
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install -y apt-transport-https
sudo apt install -y dotnet-sdk-3.1

# Cleanup
rm packages-microsoft-prod.deb
