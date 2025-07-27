#! /usr/bin/env bash

set -e

echo ""
echo "* Base Packages *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/1_base_packages.log
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
  build-essential \
  curl \
  file \
  lsb-release \
  lynx \
  man-db \
  pipewire-doc \
  plocate \
  speedtest-cli \
  time \
  tree \
  unzip \
  vim \
  wget \
  wireplumber-doc \
  >> $LOGFILE

echo "Setting base configuration files"
cp bash_aliases $HOME/.bash_aliases; source bash_aliases
cp vimrc $HOME/.vimrc

echo "Creating 'pi' account with password 'pi' and passwordless 'sudo' privileges"
sudo useradd \
  --comment "pi account" \
  --create-home \
  --groups \
    adm,cdrom,sudo,dip,plugdev,users \
  --shell /bin/bash \
  --skel /etc/skel \
  --user-group \
  pi

echo "pi:pi" | sudo chpasswd
echo "pi   ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers.d/pi_nopasswd

echo "* Finished Base Packages *"
