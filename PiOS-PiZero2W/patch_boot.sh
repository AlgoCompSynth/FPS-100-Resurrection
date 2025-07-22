#! /usr/bin/env bash

set -e

echo ""
echo "** Patch Boot ***"

echo ""
echo "Patching cmdline.txt"
sleep 10
# https://learn.adafruit.com/turning-your-raspberry-pi-zero-into-a-usb-gadget/ethernet-gadget
cp /boot/firmware/cmdline.txt .
sudo sed -i \
  's/rootwait/rootwait modules-load=dwc2,g_audio modules-load=dwc2,g_midi/' \
  /boot/firmware/cmdline.txt
diff cmdline.txt /boot/firmware/cmdline.txt || true

echo ""
echo "Patching config.txt"
sleep 10
cp /boot/firmware/config.txt .
sudo sed -i '$ a dtoverlay=dwc2' /boot/firmware/config.txt
diff config.txt /boot/firmware/config.txt || true
echo ""
echo "** Finished Patch Boot ***"
