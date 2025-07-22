#! /usr/bin/env bash

set -e

echo "Installing distrobox from git repo"
mkdir --parents $HOME/Projects
pushd $HOME/Projects
  rm -fr distrobox
  git clone https://github.com/89luca89/distrobox.git
  cd distrobox
  ./install
popd
