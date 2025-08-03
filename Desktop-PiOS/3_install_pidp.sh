#! /usr/bin/env bash

set -e

echo ""
echo "* Install PiDP *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/3_install_pidp.log
rm --force $LOGFILE

pushd /opt
  echo ""
  echo "Removing old pidp11!"
  sudo rm --force --recursive pidp11
  echo "Cloning pidp11"
  sudo git clone https://github.com/AlgoCompSynth/pidp11.git \
    >> $LOGFILE 2>&1
popd

echo "Patching install script for unattended operation"
sudo patch --backup \
  --input=unattended_install.patch \
  /opt/pidp11/install/install.sh

pushd /opt
  echo "Starting unattended install"
  /usr/bin/time /opt/pidp11/install/install.sh \
    >> $LOGFILE 2>&1

  echo "Restoring original install script"
  sudo mv /opt/pidp11/install/install.sh.orig \
          /opt/pidp11/install/install.sh
   
popd

echo ""
echo ""
echo ""
echo "Install complete. Set up remote access and reboot:"
echo ""
echo "$ sudo raspi-config"
echo "    Interface Options -> VNC"
echo "      Would you like the VNC Server to be enabled?"
echo "        Enter <Yes>"
echo "      The VNC Server is enabled"
echo "        Enter <Ok>"
echo "    Enter <Finish>"
echo "$ sudo reboot"
echo ""
echo "* Finished Install PiDP *"
