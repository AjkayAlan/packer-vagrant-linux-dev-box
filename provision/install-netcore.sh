#!/bin/zsh

# Note - snap kinda works, but kinda doesn't
sudo snap install dotnet-sdk --classic

# TODO: Replace snap with this when Microsoft releases 20.04 packages. See https://github.com/dotnet/core/issues/4360
# Install .NET Core and make it available
# wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
# sudo dpkg -i packages-microsoft-prod.deb
# sudo add-apt-repository universe
# sudo apt update
# sudo apt-fast install -y apt-transport-https
# sudo apt-fast install -y dotnet-sdk-3.1

# Cleanup
# rm packages-microsoft-prod.deb
