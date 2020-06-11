#!/bin/bash

# Update sources and upgrade base box
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade
