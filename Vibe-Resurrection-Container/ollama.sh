#! /usr/bin/env bash

set -e

echo ""
echo "** Ollama **"

source ./set_envars
pushd $HOME/.local > /dev/null
  echo "Downloading $OLLAMA_VERSION release tarball"
  wget --no-clobber --quiet $OLLAMA_URL
  echo "Extracting binaries to $HOME/.local"
  tar xf $OLLAMA_TARBALL
  echo "Creating 'ollama-serve' command"
  echo 'ollama serve > $HOME/Logfiles/ollama.log 2>&1 &' > ./bin/ollama-serve
  chmod +x ./bin/ollama-serve
  
popd > /dev/null

echo "** Finished Ollama **"
