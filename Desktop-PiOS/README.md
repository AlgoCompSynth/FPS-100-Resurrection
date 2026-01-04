# Setup Instructions

## First, download and read the manual

The operations here are derived from the 
[PiDP 11 manual](https://obsolescence.dev/pidp11/PiDP-11_Manual.pdf).
I've derived the scripts here from that manual, using the latest
PiDP 11 distribution on GitHub:
<https://github.com/obsolescence/pidp11/blob/main/README.md>. So you
should read that page too.

If you have any problems, please open an issue at
<https://github.com/AlgoCompSynth/FPS-100-Resurrection/issues/new>.

This should work on any Raspberry Pi 4 or 5 with at least 2 GB of
RAM. I've tested it with the latest Raspberry Pi OS based on
Debian `trixie` on an 8 GB Raspberry Pi 4 and a 16 GB Raspberry Pi
5.

## microSD card

First question: how big does the microSD card have to be? On my
latest install, after completion, about 13 gigabytes were in use
on the card. 

```
❯ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            7.9G     0  7.9G   0% /dev
tmpfs           1.6G   16M  1.6G   1% /run
/dev/mmcblk0p2  469G   12G  434G   3% /
tmpfs           8.0G  336K  8.0G   1% /dev/shm
tmpfs           5.0M   48K  5.0M   1% /run/lock
/dev/mmcblk0p1  510M   69M  442M  14% /boot/firmware
tmpfs           1.6G  208K  1.6G   1% /run/user/1000
```

So in theory, a 16 GB card will be enough. However, the smallest
cards I've seen recently in the local stores are 64 GB, and
high-speed 128 GB cards are common. I'd recommend a fast 64 GB
card.

Use the [Raspberry Pi Imager](https://www.raspberrypi.com/software/).
Make sure you have version 2.0.0 or later; the user interface is
different and much better! Insert your SD card in a built-in or attached
SD card read/write device and start the imager:

1. Select your Raspberry Pi device.
2. Set the Operating System to "Raspberry Pi OS (64-bit).
3. Set the Storage Device to your microSD card. Make sure this is the
microSD card and not one of the disk drives on your machine!!
4. Customisation: 
    a. Choose hostname - set the hostname you want.
    b. Localisation - set your country, time zone and keyboard layout.
    c. Choose username - the username must be "pi"; select a strong password.
    d. Choose Wi-Fi - enter your Wi-Fi credentials.
    e. SSH Authentication - "Enable SSH" and "Use password authentication."
    f. Raspberry Pi Connect - skip this; you can enable it later if you want to use it.
5. Write image: "Write". Wait. Then "I understand, erase and write."

## Connecting with secure shell (SSH)

To install the software, you will need to connect to the Raspberry Pi
from another machine and run three scripts from the command line.

From Linux, open a terminal window and type `ssh pi@<hostname>.local`,
where "<hostname>" is the hostname you set when you flashed the microSD
card. For example, my Raspberry Pi 5 has the hostname "partch", so I
type `ssh pi@partch.local`.

The first time you do this, you will see this:

```
$ ssh pi@partch.local
The authenticity of host 'partch.local (192.168.1.32)' can't be established.
ED25519 key fingerprint is SHA256:<some gibberish the machines understand>.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Answer "yes". Then you will see

```
Warning: Permanently added 'partch.local' (ED25519) to the list of known hosts.
pi@partch.local's password:
```

Enter the password for "pi" you set when you flashed the microSD card.
As they say in the movies, "You're in!"

```
$ ssh pi@partch.local 
pi@partch.local's password: 
Linux partch 6.12.47+rpt-rpi-2712 #1 SMP PREEMPT Debian 1:6.12.47-1+rpt1 (2025-09-16) aarch64


The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Sat Jan 03 17:17:58 2026
pi@partch:~ $
```

On Windows 11, this will ***not*** work from a Windows Subsystem for Linux
terminal. You need to run this from a ***PowerShell*** window.

## Cloning this repository

Type `git clone https://github.com/AlgoCompSynth/FPS-100-Resurrection.git`.
This will download this repository.

## Script conventions

1. Most of the scripts in this collection generate many lines of output
useful for troubleshooting but annoying to watch. So most scripts
redirect this output to a logfile. This file can be found in
`~/Logfiles/<script-name>.log`, where `<script-name>` is the part
of the script filename before the `.sh`. So the logfile for
`1_download_documents.sh` is in `~/Logfiles/1_download_documents.sh`.

2. All scripts are set to crash on the first error. If a script
does not print a "Finished" message, it has crashed and you
should open an issue at
<https://github.com/AlgoCompSynth/FPS-100-Resurrection/issues/new>.

The installation takes place in the directory
`FPS-100-Resurrection/Desktop-PiOS`, so `cd` into that directory. 

## Base packages

```
./1_base_packages.sh
```

will do a full Debin `dist-upgrade`, `autoremove` any obsoleted packages,
and then install some basic command line conveniences, including the `vim`
editor.

## Document downloads

```
./2_download_documents.sh
```

downloads some documents and the FPS-100 software. The documents
include 
    - the PiDP 11 Manual, 
    - a collection of DEC pdp11 manuals,
    - a collection of FPS-100 manuals, and
    - a collection of AP-120B manuals.

```
❯ ./2_download_documents.sh 

* Download Documents *
PiDP 11 / SIMH / RSX-11M Manuals: $HOME/Documents/PiDP_11
convert /home/pi/Documents/PiDP_11/PiDP-11_Manual.odt as a Writer document -> /home/pi/Documents/PiDP_11/PiDP-11_Manual.pdf using filter : writer_pdf_Export
convert /home/pi/Documents/PiDP_11/simh_doc.doc as a Writer document -> /home/pi/Documents/PiDP_11/simh_doc.pdf using filter : writer_pdf_Export
convert /home/pi/Documents/PiDP_11/pdp11_doc.doc as a Writer document -> /home/pi/Documents/PiDP_11/pdp11_doc.pdf using filter : writer_pdf_Export
Cloning Usagi Electric Repository
Cloning into 'FloatingPointSystems'...
remote: Enumerating objects: 842, done.
remote: Counting objects: 100% (69/69), done.
remote: Compressing objects: 100% (56/56), done.
remote: Total 842 (delta 25), reused 48 (delta 13), pack-reused 773 (from 2)
Receiving objects: 100% (842/842), 1.08 GiB | 33.86 MiB/s, done.
Resolving deltas: 100% (134/134), done.
Updating files: 100% (694/694), done.
Bitsavers FPS software
Bitsavers FPS documents
..Bitsavers FPS AP-120B
..Bitsavers FPS FPS-100/3000/5000
..Bitsavers FPS miscellaneous
* Finished Download Documents *

```

## Installing the PiDP 11 software

```
./3_install_pidp.sh
```

installs the PiDP 11 software; see
<https://github.com/AlgoCompSynth/pidp11?tab=readme-ov-file#install-instructions>.
Note that this script uses a fork of
<https://github.com/obsolescence/pidp11>, so if the owners of
that repo change it, this script will still work.

The install script that ships with PiDP 11 asks a number
of questions, but advises you to "just say yes." So
`3_install_pidp.sh` patches the install script for an
unattended install and runs that instead!

On my 16 GB Raspberry Pi 5, this takes about 2.5 minutes.
After the unattended install finishes, `3_install_pidp.sh`
restores the original installer in case you want to
change something.

```
❯ ./3_install_pidp.sh

* Install PiDP *
/opt ~/Projects/FPS-100-Resurrection/Desktop-PiOS

Removing old pidp11!
Cloning pidp11
~/Projects/FPS-100-Resurrection/Desktop-PiOS
Patching install script for unattended operation
patching file /opt/pidp11/install/install.sh
/opt ~/Projects/FPS-100-Resurrection/Desktop-PiOS
Starting unattended install
Restoring original install script
~/Projects/FPS-100-Resurrection/Desktop-PiOS



Install complete. Set up remote access and reboot:

$ sudo raspi-config
    Interface Options -> VNC
      Would you like the VNC Server to be enabled?
        Enter <Yes>
      The VNC Server is enabled
        Enter <Ok>
    Enter <Finish>
$ sudo reboot

* Finished Install PiDP *

```

## Setup for remote access

The system is already set up for command line access:
`ssh pi@<hostname>.local`. But you can also access the `pi`
account desktop using Virtual Network Computing (VNC). The
directions are here:

<https://www.raspberrypi.com/documentation/computers/remote-access.html#vnc>.

As the install script notes, the easiest way to do this is
with `sudo raspi-config` after the install completes.

## [Harry Partch - Wikipedia](https://en.wikipedia.org/wiki/Harry_Partch)
