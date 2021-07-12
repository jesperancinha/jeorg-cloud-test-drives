#!/bin/bash
# https://github.com/intel/thermal_daemon
# Tested on DELL and Chrome computers
echo "Make sure to run this script ONLY on DELL computers"
while true; do
    echo "Choose [Yy]* for Yes, or [Nn]* for No or just pure Ctr-C if you want to cancel."
    read -r -p "Do you want to proceed ?" yng
    case $yng in
        [Yy]* ) break;;
        [Nn]* ) echo "You bailed out!"; exit;;
        * )
    esac
done

sudo apt-get install autoconf
sudo apt-get install autoconf-archive
sudo apt-get install g++
sudo apt-get install libglib2.0-dev
sudo apt-get install libdbus-1-dev
sudo apt-get install libdbus-glib-1-dev
sudo apt-get install libxml2-dev
sudo apt-get install gtk-doc-tools
sudo apt-get install libupower-glib-dev
sudo apt-get install liblzma-dev
sudo apt-get install libevdev-dev
git clone https://github.com/intel/thermal_daemon.git
cd thermal_daemon
./autogen.sh prefix=/
make
sudo make install
