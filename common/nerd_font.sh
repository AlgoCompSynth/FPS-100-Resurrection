#! /usr/bin/env bash

set -e

echo ""
echo "*** Nerd Font ***"

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

echo "*** Finished Nerd Font ***"
