#!/bin/zsh

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# Enable the "universe" repositories
sudo add-apt-repository universe

# Update the list of products
sudo apt update

# Install PowerShell
sudo apt-fast install -y powershell

# Cleanup
rm packages-microsoft-prod.deb
