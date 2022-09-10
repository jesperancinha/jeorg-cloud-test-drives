# DNS Issues

## Problem
The following is a list of commands used to try and fix a known issues with DNS and Ubuntu.

Some versions of Ubuntu get to have a wrong configuration where the DNS service isn't able to resolve the IP's of the servers.
For that, there are several solutions presented online but none as a fixed solution.

The problem resolution can depend on several factors:

1. The Kernel version
2. The System
3. The CPU
4. The installed software
5. Anything else.

## Solution

This is a just a list that can be used as a guide to try and pinpoint the origin of the problem and to find a solution. The list is not the solution itself for the problem.
Consider this as a document filled with notes about solving the DNS issue, should you be faced with it at some point.

Wherever you find to configure DNS Servers, I used the official Google DNS servers: `8.8.8.8` and `8.8.4.4`.

Remember to back up any file you try to change. DO NOT remove `network-manager` without reading the last paragraph of this document and ONLY if you know what you are doing.

```shell
sudo apt update
sudo apt upgrade
sudo apt autoremove

# Software that can be installed
sudo apt install network-manager
sudo apt install resolvconf
sudo apt install dnsutils
sudo apt install dnsmasq
sudo apt install nscd

# A solution presented and distributed around the Blogs and Posts.
sudo rm /etc/resolv.conf
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
systemctl restart resolvconf

# A list of files that can be edited to configure the DNS servers
# Check the examples folder for examples. If the example is not available it just means that I did not change the original file in any way.
sudo vim /etc/systemd/resolved.conf
sudo vim /etc/NetworkManager/NetworkManager.conf
sudo vim /etc/resolvconf/resolv.conf.d/head
sudo vim /etc/resolvconf/resolv.conf.d/base
sudo vim /run/systemd/resolve/resolv.conf
sudo vim /etc/dhcp/dhclient.conf
sudo vim /etc/resolv.conf

# A list of files that can be edited to configure the DNS servers
# Check the examples folder for examples. If the example is not available it just means that I did not change the original file in any way.
cat /etc/systemd/resolved.conf
cat /etc/NetworkManager/NetworkManager.conf
cat /etc/resolvconf/resolv.conf.d/head
cat /etc/resolvconf/resolv.conf.d/base
cat /run/systemd/resolve/resolv.conf
cat /etc/dhcp/dhclient.conf
cat /etc/resolv.conf

# Restart elements
sudo netplan apply
sudo dhclient
sudo resolvectl flush-caches
resolvectl dns
sudo systemctl restart resolvconf
sudo systemctl restart NetworkManager
sudo systemctl restart nscd
/etc/init.d/dnsmasq start
```

## Warnings

Only remove `network-manager` if you `REALLY` `REALLY` have to! You may be led to thinking this is one option but consider this:

1. The removal of this library will stop your computer to be connected to the internet. This applies to both cable and Wi-Fi connections.
2. Your computer will have no possibility other than via BlueTooth or USB to connect to other device
3. You can via a mobile phone or usb, the correct network-manager `debian` version download. Make sure to consider if you have `arm`, `amd` or other chips and that the version you download matches your system version.

Removing the `network-manager` could nonetheless be a good idea if everything else fails. Just be sure to have the means to install it again. For example a mobile phone or an usb-drive with the correct saved distribution.
