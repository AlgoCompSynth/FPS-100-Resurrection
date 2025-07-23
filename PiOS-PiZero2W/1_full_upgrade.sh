#! /usr/bin/env bash

set -e

echo ""
echo "** Full Upgrade **"

mkdir --parents $PWD/Logs
export LOGFILE=$PWD/Logs/upgrade.log
rm --force $LOGFILE

sudo cp locale.gen /etc/locale.gen
sudo locale-gen

echo ""
echo "Update"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -qq \
  >> $LOGFILE
echo "Full upgrade"
sudo apt-get full-upgrade -qqy
echo "Autoremove"
sudo apt-get autoremove -qqy

echo "** Finished Full Upgrade **"
