#! /bin/bash

set -e

# https://wiki.debian.org/sysstat
echo "Stopping data collections"
sudo systemctl stop sysstat

echo "Editing sample time"
sleep 5
sudo vim /etc/systemd/system/sysstat.service.wants/sysstat-collect.timer

echo "Restarting data collection"
sudo systemctl daemon-reload
sudo systemctl restart sysstat
