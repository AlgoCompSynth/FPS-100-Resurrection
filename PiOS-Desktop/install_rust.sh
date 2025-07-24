#! /usr/bin/env bash

set -e

echo ""
echo "*** Rust ***"

# https://rustup.rs/
pushd /tmp > /dev/null
  rm --force install-rustup.sh
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > install-rustup.sh
  chmod +x install-rustup.sh
  ./install-rustup.sh -y > /dev/null 2>&1
  . "$HOME/.cargo/env"
popd > /dev/null

echo "*** Finished Rust ***"
