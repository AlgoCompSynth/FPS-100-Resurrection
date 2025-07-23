#! /usr/bin/env bash

set -e

echo ""
echo "** Apt Packages **"

mkdir --parents $PWD/Logs
export LOGFILE=$PWD/Logs/apt_packages.log
rm --force $LOGFILE

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -qq --assume-yes \
  apt-file \
  bash-completion \
  curl \
  file \
  git \
  lsb-release \
  lynx \
  man-db \
  pipewire-doc \
  plocate \
  screen \
  speedtest-cli \
  time \
  tmux \
  tree \
  unzip \
  usbutils \
  vim \
  wget \
  wireplumber-doc \
  >> $LOGFILE 2>&1

echo "** Finished Apt Packages **"
