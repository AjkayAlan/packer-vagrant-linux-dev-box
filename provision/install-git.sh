#!/bin/bash

# Install git, and store credentials by default
sudo apt install -y git
git config --global credential.helper store
