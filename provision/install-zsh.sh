#!/bin/bash

# Install zsh
sudo apt install -y zsh

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change default shell to zsh
sudo chsh -s /bin/zsh vagrant
zsh

# Install a nerdfont
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf -P ~/.local/share/fonts
fc-cache -vf ~/.local/share/fonts/

# Install powerlevel9k
if [ ! -d "~/.oh-my-zsh/custom/themes/powerlevel9k" ] ; then
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k\/powerlevel9k"/g' ~/.zshrc
    echo "POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zshrc
    source ~/.zshrc
fi
