#!/bin/bash

# Update sources and upgrade base box
sudo apt update
DEBIAN_FRONTEND=noninteractive sudo apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade
