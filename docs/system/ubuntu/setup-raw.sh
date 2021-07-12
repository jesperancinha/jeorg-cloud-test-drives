#!/bin/bash
apt-get update -y;
apt-get install apt-file -y;
apt-file update;
apt-get install sudo -y;
apt upgrade -y;
apt install vim -y;
apt update -y;
./setup.sh;
