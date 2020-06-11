#!/bin/zsh

sudo DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" install gnome-session gdm3
