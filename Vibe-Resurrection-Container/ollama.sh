#! /usr/bin/env bash

set -e

echo ""
echo "*** Ollama ***"

source ./set_envars
pushd $HOME/.local > /dev/null
  echo "Downloading $OLLAMA_VERSION release tarball"
  wget --no-clobber --quiet $OLLAMA_URL
  echo "Extracting binaries to $HOME/.local"
  tar xf $OLLAMA_TARBALL
  echo "Creating 'serve-ollama' command"
  echo 'ollama serve > $LOGFILES/ollama.log 2>&1 &' > ./bin/serve-ollama
  chmod +x ./bin/serve-ollama
  echo "Starting ollama server"
  ./bin/serve-ollama
  echo "Waiting 30 seconds for startup"
  sleep 30

  for model in \
    glm-4.7-flash \
    deepseek-coder-v2 \
    qwen3-coder

  do
    echo "pulling $model"
    /usr/bin/time ollama pull $model \
      > $LOGFILES/$model.log 2>&1

  done
  
popd > /dev/null

echo "*** Finished Ollama ***"
