#!/bin/bash
###########
# Collection of useful scripts for setting up a new mac machine. Includes default apps, linux terminal colors, and fonts. 
###########


# install basic apps
apt-get update && apt-get install git curl vim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# create github directory
mkdir ~/github.com

# clone fonts repo for use with oh-my-zsh
git clone https://github.com/jnutterdev/fonts.git ~/github.com/fonts

git clone https://github.com/jnutterdev/hostnames.git ~/github/hostnames && cd ~/github.com/hostnames && cp config ~/.ssh