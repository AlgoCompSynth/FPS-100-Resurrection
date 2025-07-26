# Setup Instructions

## First, download and read the manual

The operations here are derived from the 
[PiDP 11 manual](https://obsolescence.dev/pidp11/PiDP-11_Manual.pdf).
I've derived the scripts here from that manual, using the latest
PiDP 11 distribution on GitHub:
<https://github.com/obsolescence/pidp11/blob/main/README.md>.

If you have any problems, please open an issue at
<https://github.com/AlgoCompSynth/FPS-100-Resurrection/issues/new>.

This should work on any Raspberry Pi with at least 2 GB of RAM. I
have a stripped-down version running on a 512 MB Raspberry Pi
Zero 2 W, but my frustration tolerance is probably much higher than
yours. ;-)

## microSD card

In theory this will work with a 16 GB card, but the stores around
here don't regularly have any smaller than 64 GB and 512 GB ones
aren't all that expensive. But make sure you have a fast one.

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
where "<hostname> is the hostname you set when you flashed the microSD
card. For example, my Raspberry Pi 5 has the hostname "xenakis", so I
type `ssh pi@xenakis.local`.

The first time you do this, you will see this:

```
❯ ssh pi@xenakis.local
The authenticity of host 'xenakis.local (192.168.1.32)' can't be established.
ED25519 key fingerprint is SHA256:GoY1tFrV4PjDdc8RMYatzDUV0f4Oe1jLs2bfbiJfJjQ.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Answer "yes". Then you will see

```
Warning: Permanently added 'xenakis.local' (ED25519) to the list of known hosts.
pi@xenakis.local's password:
```

Enter the password for "pi" you set when you flashed the microSD card.
As they say in the movies, "You're in!"

```
❯ ssh pi@xenakis.local 
pi@xenakis.local's password: 
Linux xenakis 6.12.25+rpt-rpi-2712 #1 SMP PREEMPT Debian 1:6.12.25-1+rpt1 (2025-04-30) aarch64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Mon May 12 17:17:58 2025
pi@xenakis:~ $
```

On Windows 11, this will not work from a Windows Subsystem for Linux
terminal. You need to run this from a ***PowerShell*** window.

## Cloning this repository

Type `git clone https://github.com/AlgoCompSynth/FPS-100-Resurrection.git`.
This will download this collection of scripts. Then, download all the
documents for later:

```
cd FPS-100-Resurrection
./download_documents.sh
```

When this script finishes, a collection of documents will be in
`$HOME/Documents/PiDP 11`.

## Script conventions

Most of the scripts in this collection generate many lines of output
useful for troubleshooting but annoying to watch. So most scripts
redirect this output to a logfile. This file can be found in
`~/Logfiles/<script-name>.log`, where `<script-name>` is the part
of the script filename before the `.sh`. So the logfile for
`download_documents.sh` is in `~/Logfiles/download_documents.sh`.

All scripts are set to crash on the first error. If a script
does not print a "Finished" message, it has crashed and you
can open an issue at
<https://github.com/AlgoCompSynth/FPS-100-Resurrection/issues/new>.

## Base packages

The rest of the installation takes place in the `Desktop-PiOS` directory;
`cd Desktop-PiOS`.

```
./1_base_packages.sh
```

will do a full upgrade, install some command line conveniences,
and create an administrator account with `sudo` privileges.

Although the PiDP 11 installer installs all the packages it depends
on, I've found that a number of other packages are useful in working
at the Linux command line. The script `1_base_packages.sh` installs
them, then creates an administrator account to use when you don't
want to do administration from the main `pi` account. It will ask
you for the name of the account.

This script does a full upgrade, and may require your intervention.
If it stops for a decision, the default will work. The rest of the
scripts do not require manual intervention.

2. Run full upgrade via ssh
3. Terminal setup via ssh
4. PiDP install via ssh
5. Enable VNC
6. Reboot
7. Connect with TigerVNC
