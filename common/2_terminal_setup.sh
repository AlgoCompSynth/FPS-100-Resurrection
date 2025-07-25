#! /usr/bin/env bash

set -e

echo ""
echo "* Terminal Setup *"

echo "Creating \$HOME/Projects, \$HOME/.local/bin and \$HOME/bin"
mkdir --parents \
  $HOME/Bookshelf \
  $HOME/Desktop \
  $HOME/Documents \
  $HOME/Downloads \
  $HOME/Music \
  $HOME/Pictures \
  $HOME/Projects \
  $HOME/Public \
  $HOME/Templates \
  $HOME/Videos \
  $HOME/.local/bin \
  $HOME/bin

echo "Setting base configuration files"
cp bashrc $HOME/.bashrc; source bashrc
cp bash_aliases $HOME/.bash_aliases; source bash_aliases
cp vimrc $HOME/.vimrc

echo "Installing Starship"
./install_starship.sh

echo "Adding Starship prompt to bash"
echo 'eval "$(starship init bash)"' >> $HOME/.bashrc
echo "Restart bash to get new prompt"

echo "* Finished Terminal Setup *"
