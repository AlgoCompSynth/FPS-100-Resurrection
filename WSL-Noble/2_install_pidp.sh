#! /usr/bin/env bash

set -e

echo ""
echo "* Install PiDP *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/2_install_pidp.log
rm --force $LOGFILE
export UNATTENDED_INSTALL_SCRIPT="$PWD/unattended_install.sh"

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
  sudo cp $UNATTENDED_INSTALL_SCRIPT /opt/
  /usr/bin/time su -c "/opt/unattended_install.sh > /tmp/unattended_install.log 2>&1" pi
  echo "Collecting unattended install logfile"
  cat /tmp/unattended_install.log >> $LOGFILE
popd

echo "* Finished Install PiDP *"
