#! /usr/bin/env bash

set -e

echo ""
echo "*** Installing sysstat ***"

mkdir --parents "$PWD/Logs"
export LOGFILE="$PWD/Logs/install_sysstat.log"
rm --force $LOGFILE

echo "Installing sysstat"
sudo apt-get install --assume-yes \
  sysstat \
  >> $LOGFILE 2>&1

echo "Enabling sysstat"
# https://wiki.debian.org/sysstat
sudo systemctl enable --now sysstat.service
systemctl status sysstat.service

echo "Stopping data collections"
sudo systemctl stop sysstat

echo "Editing sample time"
diff sysstat-collect.timer /etc/systemd/system/sysstat.service.wants/sysstat-collect.timer || true
sudo cp sysstat-collect.timer /etc/systemd/system/sysstat.service.wants/sysstat-collect.timer

sleep 5
echo "Restarting data collection"
sudo systemctl daemon-reload
sudo systemctl restart sysstat
