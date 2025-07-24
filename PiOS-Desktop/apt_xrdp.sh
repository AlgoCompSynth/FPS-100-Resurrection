#! /usr/bin/env bash

set -e

echo ""
echo "*** xrdp ***"

mkdir --parents "$PWD/Logs"
export LOGFILE="$PWD/Logs/xrdp.log"
rm --force $LOGFILE

/usr/bin/time sudo apt-get install --assume-yes \
  pipewire-module-xrdp \
  xrdp \
  >> $LOGFILE 2>&1

sudo systemctl enable --now xrdp.service

echo "Finished"
