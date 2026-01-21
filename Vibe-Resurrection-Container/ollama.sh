#! /usr/bin/env bash

set -e

echo ""
echo "** Ollama **"

# https://starship.rs/guide/#%F0%9F%9A%80-installation
source ./set_envars
pushd $HOME/.local > /dev/null
  echo "Downloading $OLLAMA_VERSION release tarball"
  wget --no-clobber --quiet $OLLAMA_URL
  echo "Extracting binaries to $HOME/.local"
  tar xf $OLLAMA_TARBALL
popd > /dev/null

echo "** Finished Ollama **"
