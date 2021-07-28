#!/bin/bash
echo "==== You are running a Mac-OS library update ===="
echo "Version 0.0.1"
echo "1) Your system has to be one of Mac-OS"
echo "2) You have to run this in a relative scope: '. ./setup.sh'"
echo "3) A lot of libraries will be installed"

echo "We are assuming you are running this with '. ./setup.sh' and that you have enough space for this"
echo "Hit Ctr-C if you just changed your mind"
while true; do
    echo "Choose [Yy]* for Yes, or [Nn]* for No or just pure Ctr-C if you want to cancel."
    read -r -p "Do you want to proceed ?" yng
    case $yng in
        [Yy]* ) break;;
        [Nn]* ) echo "You bailed out!"; return;;
        * )
    esac
done

./commands.sh