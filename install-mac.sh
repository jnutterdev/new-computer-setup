#!/bin/bash
###########
# Collection of useful scripts for setting up a new mac machine. Includes default apps, mac os terminal colors, and fonts. 
###########

# install homebrew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install basic apps
brew install git curl vim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# create github directory
mkdir ~/github.com

# clone fonts repo for use with oh-my-zsh
git clone https://github.com/jnutterdev/fonts.git ~/github.com/fonts

git clone https://github.com/jnutterdev/hostnames.git ~/github/hostnames && cd ~/github.com/hostnames && cp config ~/.ssh