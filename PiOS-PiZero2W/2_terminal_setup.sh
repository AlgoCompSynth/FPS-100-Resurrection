#! /usr/bin/env bash

set -e

echo ""
echo "*** Terminal Setup ***"

echo "Creating HOME/Projects, HOME/.local/bin and HOME/bin"
mkdir --parents $HOME/Projects
mkdir --parents $HOME/.local/bin
mkdir --parents $HOME/bin

echo "Setting base configuration files"
cp bashrc $HOME/.bashrc; source bashrc
cp bash_aliases $HOME/.bash_aliases; source bash_aliases
cp vimrc $HOME/.vimrc

echo "Installing time, unzip and vim"
sudo apt-get update -qq
sudo apt-get install -qqy time unzip vim

echo "Installing Starship"
./install_starship.sh

echo "Adding Starship prompt to bash"
echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

echo "Adding 'omega' admin user"
sudo useradd \
  --comment "System Administrator" \
  --create-home \
  --groups sudo \
  --shell /usr/bin/bash \
  --user-group \
  omega

echo "Enter a password for the 'omega' user"
sudo passwd omega

echo "Enabling passwordless 'sudo' for 'omega'"
echo "omega ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers.d/010_pi-nopasswd

echo "Finished"
