#!/usr/bin/env sh
sudo dhclient
sudo resolvectl flush-caches
resolvectl dns
