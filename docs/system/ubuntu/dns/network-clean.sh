#!/usr/bin/env sh
sudo dhclient
sudo resolvectl flush-caches
sudo resolvectl dns
