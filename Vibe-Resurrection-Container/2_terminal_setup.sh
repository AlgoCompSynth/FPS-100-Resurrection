#! /usr/bin/env bash

set -e

echo ""
echo "* Terminal Setup *"

echo "Creating \$HOME/.local/bin"
mkdir --parents $HOME/.local/bin

echo "Setting base configuration files"
cp bash_aliases $HOME/.bash_aliases; source bash_aliases
cp vimrc $HOME/.vimrc

./unattended_upgrade.sh
./nerd_fonts.sh
./starship.sh
./ollama.sh
./pkg_db_updates.sh

echo "* Finished Terminal Setup *"
