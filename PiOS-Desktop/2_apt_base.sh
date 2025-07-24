#! /usr/bin/env bash

set -e

echo ""
echo "*** Base Packages ***"

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
sudo apt-get full-upgrade -qq --assume-yes \
  >> $LOGFILE
echo "Installing base packages"
sudo apt-get install -qq --assume-yes \
  apt-file \
  bash-completion \
  build-essential \
  cmake \
  curl \
  dirmngr \
  file \
  git \
  gpg-agent \
  lsb-release \
  lynx \
  man-db \
  minicom \
  pipewire-doc \
  pkg-config \
  plocate \
  podman \
  python3-dev \
  python3-pip \
  python3-setuptools \
  python3-venv \
  python3-wheel \
  screen \
  speedtest-cli \
  tilix \
  time \
  tmux \
  tree \
  uidmap \
  unzip \
  usbutils \
  variety \
  vim \
  wget \
  wireplumber-doc \
  >> $LOGFILE 2>&1

./install_rust.sh
./install_distrobox.sh
./apt_install_sysstat.sh
./apt_xpra.sh
./apt_xrdp.sh
./apt_pkg_db_updates.sh

echo "1. Disable auto-logon for both console and desktop."
echo "2. Select x11 backend."
echo "3. Select pulseaudio audio server."
sleep 10
sudo raspi-config

echo "Finished"
