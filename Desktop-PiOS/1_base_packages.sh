#! /usr/bin/env bash

set -e

echo ""
echo "* Base Packages *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/2_base_packages.log
rm --force $LOGFILE

sudo cp locale.gen /etc/locale.gen
sudo locale-gen

echo ""
echo "Update"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -qq \
  >> $LOGFILE
echo "Starting full upgrade"
echo "Choose the default for any configuration file updates"
sudo apt-get full-upgrade -qqy
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
