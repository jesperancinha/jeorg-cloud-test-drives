#!/usr/bin/env sh
sudo systemctl restart resolvconf
sudo systemctl restart NetworkManager
sudo systemctl restart nscd
sudo /etc/init.d/dnsmasq start
sudo systemctl restart bind9.service
