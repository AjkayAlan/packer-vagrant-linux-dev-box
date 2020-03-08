#!/bin/zsh

# Remove apt cache
sudo apt clean -y
sudo apt autoclean -y

# Cleanup logs
sudo find /var/log -type f -iname '*.log' -print0 | sudo xargs -0 truncate -s0

# Set zeros to free space to help with compression
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
