#! /usr/bin/env bash

set -e

echo ""
echo "*** Install PiDP ***"

mkdir --parents $PWD/Logs
export LOGFILE=$PWD/Logs/install_pidp.log
rm --force $LOGFILE

sudo mkdir --parents /opt/pidp11
cd /opt
sudo wget http://pidp.net/pidp11/2024/pidp11.tar.gz
sudo gzip -d pidp11.tar.gz
sudo tar -xvf pidp11.tar
sudo /opt/pidp11/install/install.sh

echo "*** Finished Install PiDP ***"
