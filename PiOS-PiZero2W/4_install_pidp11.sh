#! /usr/bin/env bash

set -e

echo ""
echo "*** Install PiDP-11 ***"

mkdir --parents $PWD/Logs
export LOGFILE=$PWD/Logs/install_pidp11.log
rm --force $LOGFILE

pushd /opt
  #sudo git clone https://github.com/obsolescence/pidp11.git
popd
sudo cp hacked_install.sh /opt/pidp11/install/
ls -l /opt/pidp11/install/

echo "*** Finished Install PiDP-11 ***"
