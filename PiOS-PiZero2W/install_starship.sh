#! /usr/bin/env bash

set -e

# https://starship.rs/guide/#%F0%9F%9A%80-installation
pushd /tmp > /dev/null
  export BIN_DIR=$HOME/.local/bin
  rm --force install.sh
  curl --silent --show-error --remote-name https://starship.rs/install.sh
  chmod +x install.sh
  ./install.sh --yes > /dev/null
popd > /dev/null
