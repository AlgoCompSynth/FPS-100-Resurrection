#! /usr/bin/env bash

set -e

echo ""
echo "*** Reconfigure Bluetooth ***"

# https://wiki.debian.org/BluetoothUser
sudo service bluetooth stop
diff main.conf /etc/bluetooth/main.conf || true
sudo cp main.conf /etc/bluetooth/main.conf
sudo service bluetooth start

echo "*** Finished Reconfigure Bluetooth ***"
