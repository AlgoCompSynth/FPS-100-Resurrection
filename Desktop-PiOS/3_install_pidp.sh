#! /usr/bin/env bash

set -e

echo ""
echo "* Install PiDP *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/3_install_pidp.log
rm --force $LOGFILE
#export UNATTENDED_INSTALL="$PWD/unattended_install.sh"

pushd /opt
  echo ""
  echo "Removing old pidp11!"
  sudo rm --force --recursive pidp11
  echo "Cloning pidp11"
  sudo git clone https://github.com/obsolescence/pidp11.git \
    >> $LOGFILE
popd

echo "Patching install script for unattended operation"
sudo patch --backup /opt/pidp11/install/install.sh < unattended_install.patch

pushd /opt
  echo "Starting unattended install"
  /usr/bin/time /opt/pidp11/install/install.sh
popd

echo ""
echo ""
echo ""
echo "Install complete. Set up remote access and reboot"
echo ""
echo "  sudo raspi-config"
echo "    Advanced Options -> Audio Config: Select PulseAudio"
echo "    Interface Options -> VNC: Yes"
echo "    Finish -> Reboot now? Yes"
echo ""
echo "* Finished Install PiDP *"
