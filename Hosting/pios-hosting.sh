#! /usr/bin/env bash

set -e

echo ""
echo "*** PiOS Hosting ***"

mkdir --parents $PWD/Logs
export LOGFILE=$PWD/Logs/pios-hosting.log
rm --force $LOGFILE

echo "Installing Docker and Podman"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install --assume-yes \
  docker.io \
  podman \
  time \
  >> $LOGFILE 2>&1

echo ""
echo "Adding $USER to 'docker' group"
sudo usermod --append --groups docker $USER
echo "You will need to log out and back in to run Docker"
echo ""

echo "*** Finished PiOS Hosting ***"
