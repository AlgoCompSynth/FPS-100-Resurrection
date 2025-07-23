#! /usr/bin/env bash

set -e

echo ""
echo "** Terminal Setup **"

echo "Creating HOME/Projects, HOME/.local/bin and HOME/bin"
mkdir --parents $HOME/Projects
mkdir --parents $HOME/.local/bin
mkdir --parents $HOME/bin

echo "Setting base configuration files"
cp bashrc $HOME/.bashrc; source bashrc
cp bash_aliases $HOME/.bash_aliases; source bash_aliases
cp vimrc $HOME/.vimrc

echo "Editing swapfile size"
./pios_edit_swapfile_size.sh

echo "Installing time, unzip and vim"
sudo apt-get update -qq
sudo apt-get install -qqy time unzip vim

echo "** Finished Terminal Setup **"
