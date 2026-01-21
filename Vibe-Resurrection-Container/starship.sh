#! /usr/bin/env bash

set -e

echo ""
echo "** Starship **"

# https://starship.rs/guide/#%F0%9F%9A%80-installation
pushd /tmp > /dev/null
  echo "Installing Starship"
  export BIN_DIR=$HOME/.local/bin
  rm --force install.sh
  curl --silent --show-error --remote-name https://starship.rs/install.sh
  chmod +x install.sh
  ./install.sh --yes > /dev/null
popd > /dev/null

echo "Setting configuration file"
mkdir --parents $HOME/.config
cp starship.toml $HOME/.config/starship.toml

echo "Appending Starship init to \$HOME/.bashrc"
echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

echo "** Finished Starship **"
