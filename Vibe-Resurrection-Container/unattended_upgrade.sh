#! /usr/bin/env bash

set -e

echo ""
echo "*** Unattended Upgrade ***"

export DEBIAN_FRONTEND=noninteractive
echo "Update"
sudo apt-get update -qq
echo "Upgrade"
# https://debian-handbook.info/browse/stable/sect.automatic-upgrades.html
yes '' \
  | sudo apt-get -qqy \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  full-upgrade
echo "Autoremove"
sudo apt-get autoremove -qqy

echo "*** Finished Unattended Upgrade ***"
