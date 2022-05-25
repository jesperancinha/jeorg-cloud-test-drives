# XORG Config handling issues

## Accidental run of: `sudo rm /usr/share/X11/xorg.conf.d/*`

Sometimes we go to far and we accidentally remove what we shouldn't. With these steps, you'll be able to recover you Ubuntu machine easily if your experience:

1. The removal of bespoken folder (or its associates)
2. Your keyboard and mouse get stuck (not guaranteed)

First of all, you need to start your machine in safe mode and with networking. To do that, press `ESC` a few times when your machine is starting.

You should get a pop-up with the option networking. If you cannot connect to the WiFi in this way, you can still use a network cable to connect to your network.

Then you need to type in these commands:

1. `dpkg -S /usr/share/X11/xorg.conf.d` -> This will give you a list of all modules you have to reinstall.

2. `apt-get install --reinstall install xserver-xorg-input-libinput xserver-xorg-input-wacom xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-video-amdgpu xserver-xorg-input-vmmouse xserver-xorg-core` -> This will install the modules. Note that this is just an example. You need to install all modules listed when running the above commmand on number 1.

3. Restart your machine.

## References

- [Keyboard and mouse doesn't work after accidental deletion of xorg.conf.d](https://unix.stackexchange.com/questions/389989/keyboard-and-mouse-doesnt-work-after-accidental-deletion-of-xorg-conf-d)

