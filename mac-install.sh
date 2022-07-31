#!/bin/bash
###########
# Collection of useful scripts for setting up a new mac machine. Includes default apps, mac os terminal colors, and fonts. 
###########

# install homebrew 
if [ "$(which brew)" == "" ]; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else 
    echo "Homebrew is installed" 1>&2
    brew list curl vim 1>&2 || brew install curl vim;
fi

# install oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh" 1>&2
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    cp simple.zsh-theme $HOME/.oh-my-zsh/custom/themes
else
    echo "oh-my-zsh is installed" 1>&2
    cp simple.zsh-theme $HOME/.oh-my-zsh/custom/themes
fi 

# create github directory
if [ ! -d $HOME/github.com ]; then
    echo "Created github.com directory"
    mkdir $HOME/github.com
else
  echo "github.com already exists" 1>&2
fi

# setup github autocompletion
if [ ! -d $HOME/.zsh ]; then
    echo "Created github.com directory"
    mkdir $HOME/.zsh
    cp _git git-completion.bash $HOME/.zsh/
else
  echo ".zsh already exists" 1>&2
fi


# clone fonts repo for use with oh-my-zsh
if [ ! -d $HOME/github.com/fonts ]; then
    echo "Cloning fonts and installing"
    git clone https://github.com/jnutterdev/fonts.git $HOME/github.com/fonts
    $HOME/github.com/fonts/./install.sh
else
    echo "Powerline fonts already installed" 1>&2
fi

if [ -d $HOME/.ssh ]; then
    echo "Copying ssh config"
    cp $HOME/github.com/new-computer-setup/config $HOME/.ssh/config
else
    echo "ssh config updated" 1>&2
fi