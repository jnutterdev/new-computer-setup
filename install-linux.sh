#!/bin/bash
###########
# Collection of useful scripts for setting up a new mac machine. Includes default apps, linux terminal colors, and fonts. 
###########


# install basic apps
sudo apt-get update && sudo apt-get install openssh-server git curl vim -y

# install zsh, set as default
if [ "$(which zsh)" == "" ]; then
    echo "Installing zsh"
    sudo apt-get install zsh -y
    chsh -s /usr/bin/zsh
elif [ "$(echo $SHELL)" != "/usr/bin/zsh" ]; then
    chsh -s /usr/bin/zsh     
    echo "Changed to zsh"
else
    echo "Zsh is already installed and default shell"
fi

# install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is installed" 1>&2
fi 

# create github directory
if [ ! -d ~/github.com ]; then
    echo "Created github.com directory"
    mkdir ~/github.com
else
  echo "github.com already exists" 1>&2
fi

# clone fonts repo for use with oh-my-zsh
if [ ! -d ~/github.com/fonts ]; then
    echo "Cloning fonts and installing"
    git clone https://github.com/jnutterdev/fonts.git ~/github.com/fonts
    ~/github.com/fonts/./install.sh
else
    echo "Powerline fonts already installed" 1>&2
fi

if [ ! -d ~/.ssh ]; then
    echo "Creating .ssh directory"
    mkdir ~/.ssh
elif 
    echo "Copying ssh config"
    cp ~/github.com/new-computer-setup/config ~/.ssh/config
else
    echo "ssh config updated" 1>&2
fi
