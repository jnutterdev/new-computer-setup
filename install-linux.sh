#!/bin/bash
###########
# Collection of useful scripts for setting up a new mac machine. Includes default apps, linux terminal colors, and fonts. 
###########


# install basic apps
apt-get update && apt-get install git curl vim

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

if [ -d ~/.ssh ]; then
    echo "Copying ssh config"
    cp ~/github.com/new-computer-setup/config ~/.ssh/config
else
    echo "ssh config updated" 1>&2
fi