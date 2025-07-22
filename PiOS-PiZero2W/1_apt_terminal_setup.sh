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

echo "Enabling backports"
sudo cp backports.list /etc/apt/sources.list.d/

echo "Installing time, unzip and vim"
sudo apt-get update -qq
sudo apt-get install -qqy time unzip vim

echo "Downloading patched MesloLG Nerd fonts"
pushd /tmp > /dev/null
  rm --force --recursive Meslo*
  curl -sOL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
  mkdir Meslo
  cd Meslo
  unzip -qq ../Meslo.zip

  echo "Copying to HOME/.fonts"
  mkdir --parents $HOME/.fonts
  cp *.ttf $HOME/.fonts

  popd > /dev/null

echo "Installing Starship"
./install_starship.sh

echo "Adding Starship prompt to bash"
echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

echo "** Finished Terminal Setup **"
