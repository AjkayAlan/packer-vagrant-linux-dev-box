#!/bin/bash

# Install git, and store credentials by default
sudo apt-fast install -y git
git config --global credential.helper store
