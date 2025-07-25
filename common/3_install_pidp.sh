#! /usr/bin/env bash

set -e

echo ""
echo "* Install PiDP *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/install_pidp.log
rm --force $LOGFILE
export UNATTENDED_INSTALL="$PWD/unattended_install.sh"

echo "Downloading fresh copy of FPS software to \$HOME/fps100sw"
pushd $HOME > /dev/null
  rm --force --recursive fps100sw*
  wget --quiet \
    https://bitsavers.org/bits/FloatingPointSystems/FPS100/fps100sw.zip
  unzip fps100sw.zip \
    >> $LOGFILE
  rm --force fps100sw.zip
  chmod o+rx fps100sw
  chmod go+r fps100sw/*
popd > /dev/null

pushd /opt
  echo ""
  echo "Removing old pidp11!"
  sudo rm --force --recursive pidp11
  echo "Cloning pidp11"
  sudo git clone https://github.com/obsolescence/pidp11.git
  echo "Starting unattended install"
  /usr/bin/time $UNATTENDED_INSTALL >> $LOGFILE 2>&1
popd

echo "Install complete. Set up remote access and reboot"
echo ""
echo "  sudo raspi-config"
echo "    Advanced Options -> Audio Config: Select PulseAudio"
echo "    Advanced Options -> Wayland: Select Wayfire"
echo "    Interface Options -> VNC: Yes"
echo "    System Options -> Auto Login: No to console, yes to desktop"
echo "    Finish: Reboot"
echo ""
echo "* Finished Install PiDP *"
