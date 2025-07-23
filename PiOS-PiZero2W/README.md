# Installation process

## About the Raspberry Pi Zero 2 W
The Raspberry Pi Zero 2 W has four 1 GHz 64-bit Arm cores, 512
megabytes of RAM, 2.4 GHz WiFi, Bluetooth, a microSD card slot,
two USB ports (one for power and one for data), and a micro HDMI
display connector. For about $25US, you can get a Raspberry Pi
Zero 2 W and a case. That's less than many microcontroller boards
with much less compute power and RAM!

Although you can connect an HDMI display and USB or Bluetooth
keyboard and mouse, I don't use mine that way. 512 megabytes
is not really enough for a desktop and complex GUI apps, and
I'm a hard-core command-line user anyhow. So this setup will
run PiDP-11 in headless mode over the network. If you want
to experience all the visual glory of the PDP-11, you'll need a
Raspberry Pi 4 or 5, or run the container version of this.

## SD card preparations

1. Get a fresh microSD card. In theory, an 8 GB one will be fine
but the smallest ones the grocery stores around here have are 64 GB!
Put the card in your SD card read-write device.

2. Open the Raspberry Pi Imager and make the following selections:

    a. Raspberry Pi device: Raspberry Pi Zero 2 W,
    b. Operating system: Raspberry Pi OS (other) -> Raspberry Pi OS Lite (64-bit),
    c. Storage: your microSD card.

    Press 'Next'. On the next page, press the 'Edit Settings' button.
    On the 'General' tab, set your hostname, username and password,
    configure the wireless LAN and set the locale. You can use any
    username you want, but *don't* use the default 'pi'! The PiDP-11
    software uses that for its installation.

    On the 'Services' tab, enable SSH and select the 'Use password
    authentication' radio button. Select all three options on the
    'Options' tab. Go back and check your entries on the first two
    tabs and then press 'Save'.

    Now you're ready to write the card. Press the 'Yes' button. Press
    'Yes' again on the confirmation dialog box. After the card is
    written and verified, remove it from the card read-write device
    and insert it in the card slot on the Raspberry Pi Zero 2 W.
