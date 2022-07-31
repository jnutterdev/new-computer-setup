#!/bin/bash
###########
# Collection of useful scripts for setting up a new mac machine. Includes default apps, linux terminal colors, and fonts. 
###########


# install basic apps
sudo apt-get update && sudo apt-get install openssh-server git curl vim -y

# install zsh, set as default
if [ "$(which zsh)" == "" ]; then
    echo "Installing zsh" 1>&2
    sudo apt-get install zsh -y
    chsh -s /usr/bin/zsh
elif [ "$(echo $SHELL)" != "/usr/bin/zsh" ]; then
    sudo chsh -s /usr/bin/zsh -y   
    echo "Changed to zsh" 1>&2
else
    echo "Zsh is already installed and default shell" 1>&2
fi

# install oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh" 1>&2
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is installed" 1>&2
fi 

# create github directory
if [ ! -d $HOME/github.com ]; then
    echo "Created github.com directory" 1>&2
    mkdir $HOME/github.com
else
  echo "github.com already exists" 1>&2
fi

# clone fonts repo for use with oh-my-zsh
if [ ! -d $HOME/github.com/fonts ]; then
    echo "Cloning fonts and installing" 1>&2
    git clone https://github.com/jnutterdev/fonts.git ~/github.com/fonts
    $HOME/github.com/fonts/./install.sh
else
    echo "Powerline fonts already installed" 1>&2
fi

if [ ! -d ~/.ssh ]; then
    echo "Creating .ssh directory" 1>&2
    mkdir ~/.ssh
    cp config $HOME/.ssh/
elif [ -d $HOME/.ssh ]; then
    echo "Copying ssh config" 1>&2
    cp config $HOME/.ssh/
else
    echo "ssh config updated" 1>&2
fi
