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

## The second monitor just disappeard

Yeah, Ubuntu can do this if your monitor is unstable enough. The only thing you can do to recover one or more monitors is to activate them via a `xrandr` command.

1. `xand` -> This will list all your monitors:

```text
eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 309mm x 174mm
DP-1 connected (normal left inverted right x axis y axis)
   1920x1080     60.00 +  74.97    50.00    59.94  
HDMI-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
HDMI-2 disconnected (normal left inverted right x axis y axis)
```

In this example, we have three monitors: `eDP-1`, `DP-1` and `DP-2`. You need to find out the monitors you need to activate. Ubuntu keeps a record of them. Once you know the name of the monitors, you can use that in the next step

2. `xrandr --output DP-2 --auto` -> You can activate your monitors this way.

