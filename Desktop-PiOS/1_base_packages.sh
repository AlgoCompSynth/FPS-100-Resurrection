#! /usr/bin/env bash

set -e

echo ""
echo "* Base Packages *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/base_packages.log
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
sudo apt-get autoremove -qqy \
  >> $LOGFILE
echo "Base packages"
sudo apt-get install -qqy \
  apt-file \
  bash-completion \
  curl \
  file \
  lsb-release \
  lynx \
  man-db \
  plocate \
  speedtest-cli \
  time \
  tree \
  vim \
  wget \
  >> $LOGFILE

echo "Enter name for new administrator account with 'sudo' privileges"
read -p "Name cannot be 'pi': " admin_name
echo "Adding $admin_name admin user"
sudo useradd \
  --comment "System Administrator" \
  --create-home \
  --groups sudo \
  --shell /usr/bin/bash \
  --user-group \
  "$admin_name"

echo "Enter a password for the $admin_name user"
sudo passwd "$admin_name"

echo "* Finished Base Packages *"
