#! /usr/bin/env bash

set -e

echo ""
echo "** Apt Base **"
./unattended_upgrade.sh
export DEBIAN_FRONTEND=non-interactive
sudo apt install -qqy \
  apt-file \
  git \
  info \
  time \
  vim
sudo apt-file update > /dev/null

echo "** Finished Apt Base **"
