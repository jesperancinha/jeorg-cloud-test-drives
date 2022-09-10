#!/usr/bin/env sh
sudo dhclient
sudo netplan apply
sudo resolvectl flush-caches
resolvectl dns
sudo systemctl restart resolvconf
sudo systemctl restart NetworkManager
sudo systemctl restart nscd
/etc/init.d/dnsmasq start
sudo systemctl restart bind9.service
