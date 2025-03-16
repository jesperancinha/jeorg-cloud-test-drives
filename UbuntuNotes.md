## JEorg Cloud Test Drives - Ubuntu Notes

# Restore desktop

```shell
systemctl start NetworkManager
nmcli dev wifi
sudo apt-get install plymouth-themes
sudo apt-get install kde-full
# sudo service sddm stop
sudo apt remove libqt5quick5-gles
sudo apt install libqt5quick5
# sudo service sddm start
# sudo apt-get install -y breeze-gtk-theme
sudo apt install --reinstall sddm-theme-breeze
```

# Helpful

```shell
sudo apt-get install kde-plasma-desktop 
kbuildsycoca5 --noincremental
sudo apt install gnome-tweaks
sudo apt-get reinstall plasma-workspace
sudo gnome-tweaks
sudo apt-get install --reinstall dnsmasq --fix-missing
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo add-apt-repository --remove ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ubuntu-drivers-common
vmware-modconfig --console --install-all
cd /usr/bin/
sudo ln -s python3.10 python
sudo apt-get install ffmpeg
```


# Pipenvs

```shell
sudo apt remove pipenv
pip3 install pipenv
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install python3.9
python3 -m pipenv shell
sudo apt-get install pipenv
exit
sudo ln -s /usr/bin/python3.10 /usr/bin/python
```

# Unlock Chrome after Hostname changes
!CAREFUL USING THIS!

```shell
rm -rf ~/.config/google-chrome/Singleton*
```

[Back](Readme.md)
