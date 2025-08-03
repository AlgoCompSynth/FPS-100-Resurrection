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
RAM.

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

1. Set the Operating System to "Raspberry Pi OS (64-bit).
2. Set the Storage to your microSD card.
3. Press 'Next'. Choose the "Edit Settings" button. On the "General" tab:

    a. Set the hostname you want.
    b. Set the username to "pi" and supply a strong password.
    c. Configure the wireless LAN and set the locale settings.

    On the "Services" tab, select "Enable SSH" and "Use password authentication".

    On the "Options" tab, select all the options. Go back and check the other
    two tabs and then press the "Save" button.

4. You will be back on the "Use OS Customization" dialog box. Press the "Yes"
button, and then press the "Yes" button on the "Warning" dialog box to flash
and verify the microSD card.

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
ED25519 key fingerprint is SHA256:GoY1tFrV4PjDdc8RMYatzDUV0f4Oe1jLs2bfbiJfJjQ.
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
Linux partch 6.12.25+rpt-rpi-2712 #1 SMP PREEMPT Debian 1:6.12.25-1+rpt1 (2025-04-30) aarch64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Mon May 12 17:17:58 2025
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

## Document downloads

```
./1_download_documents.sh
```

downloads some documents and the FPS-100 software. The documents
include 
    - the PiDP 11 Manual, 
    - a collection of DEC pdp11 manuals,
    - a collection of FPS-100 manuals, and
    - a collection of AP-120B manuals.

```
$ ./1_download_documents.sh 

* Download Documents *
PiDP 11 Manual: $HOME/Documents/PiDP_11
DEC Manuals: $HOME/Documents/DEC
FPS-100 Manuals: $HOME/Documents/FPS-100
AP-120B Manuals: $HOME/Documents/AP-120B

Downloading fresh copy of FPS software to $HOME/fps100sw
* Finished Download Documents *
```

## Base packages

```
./2_base_packages.sh
```

will do a full upgrade, `autoremove` any obsoleted packages, and then
install some basic command line conveniences, including the `vim`
editor.

At the time of this writing, the full upgrade step requires some manual
intervention, so its output is not logged. That might go away in future
Raspberry Pi updates, but as of 2025-08-02, it will stop and ask you
how you want to deal with an updated configuration file. The default
will work, so just press `Enter` if this happens.

```
Configuration file '/etc/initramfs-tools/initramfs.conf'
 ==> Modified (by you or by a script) since installation.
 ==> Package distributor has shipped an updated version.
   What would you like to do about it ?  Your options are:
    Y or I  : install the package maintainer's version
    N or O  : keep your currently-installed version
      D     : show the differences between the versions
      Z     : start a shell to examine the situation
 The default action is to keep your current version.
*** initramfs.conf (Y/I/N/O/D/Z) [default=N] ?
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
$ ./3_install_pidp.sh 

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
