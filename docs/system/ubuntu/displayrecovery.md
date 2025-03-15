# JEOrg Cloud Test Drives - Display recovery

##### Install Hybrid display mode

Problem: The HDMI display port is failing.

There could be a problem with dual display. The command `prime-select` may help solve the problem by forcing a Hybrid display model with NVIDIA drivers and Intel drivers.

```shell
sudo apt install nvidia-prime
sudo prime-select on-demand
```

Note that command `sudo prime-select nvidia` will only select nvidia drivers, meaning that only the external device will be on.
On the other hand, command `sudo prime-select intel` will only select the laptop display, which usually relies on an intel drivers.
The above statements describe what is likely to occur, but only `on-demand` guarantees both drivers to be activated if they can be activated.

##### Reinstall NVIDEA drivers

Problem: The HDMI display port doesn't work. The monitors do not turn up. All other options above have been tried. 

Sometimes configuration can be automatically changed. In those cases, a re-installation of the drivers may solve this problem. 

```shell
sudo apt remove --purge '^nvidia-.*'
sudo ubuntu-drivers autoinstall
sudo reboot
```