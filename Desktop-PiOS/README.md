# Setup Instructions

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

2. Run full upgrade via ssh
3. Terminal setup via ssh
4. PiDP install via ssh
5. Enable VNC
6. Reboot
7. Connect with TigerVNC
