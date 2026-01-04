#! /usr/bin/env bash

set -e

echo ""
echo "* Base Packages *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/1_base_packages.log
rm --force $LOGFILE

export DEBIAN_FRONTEND=noninteractive
echo "Update"
sudo apt-get update -qq \
  >> $LOGFILE
echo "Upgrade"
# https://debian-handbook.info/browse/stable/sect.automatic-upgrades.html
yes '' \
  | sudo apt-get -qqy \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  dist-upgrade \
  >> $LOGFILE
echo "Autoremove"
sudo apt-get autoremove -qqy \
  >> $LOGFILE
echo "Base packages"
sudo apt-get install -qqy \
  apt-file \
  bash-completion \
  build-essential \
  curl \
  file \
  libreoffice-writer \
  lsb-release \
  lynx \
  man-db \
  plocate \
  speedtest-cli \
  time \
  tree \
  unzip \
  vim \
  wget \
  >> $LOGFILE

echo "* Finished Base Packages *"
