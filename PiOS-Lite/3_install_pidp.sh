#! /usr/bin/env bash

set -e

echo ""
echo "* Install PiDP *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/install_pidp.log
rm --force $LOGFILE
export UNATTENDED_INSTALL="$PWD/unattended_install.sh"

pushd /opt
  sudo git clone https://github.com/obsolescence/pidp11.git
  $UNATTENDED_INSTALL
popd

echo "* Finished Install PiDP *"
