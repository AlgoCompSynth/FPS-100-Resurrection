#! /usr/bin/env bash

set -e

echo ""
echo "** Packages **"

mkdir --parents $PWD/Logs
export LOGFILE=$PWD/Logs/base.log
rm --force $LOGFILE

sudo cp locale.gen /etc/locale.gen
sudo locale-gen

echo ""
echo "Update"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -qq \
  >> $LOGFILE
echo "Full upgrade"
sudo apt-get full-upgrade -qq --assume-yes
echo "Autoremove"
sudo apt-get autoremove -qq --assume-yes
./apt_packages.sh
./apt_pkg_db_updates.sh
./patch_boot.sh
./reconfig_bluetooth.sh

echo ""
echo "1. Disable auto-logon for both console and desktop."
echo "2. Select x11 backend."
echo "3. Select pulseaudio audio server."
sleep 10
sudo raspi-config

echo "** Finished Base Packages **"
