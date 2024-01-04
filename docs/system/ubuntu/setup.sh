#!/bin/bash
echo "==== You are running an Ubuntu recipe library update ===="
echo "Version 0.0.1"
echo "1) Your system has to be ubuntu"
echo "2) You have to run this in a relative scope: '. ./setup.sh'"
echo "3) A lot of libraries will be installed"
echo "4) Some docker machines need these commands first to be run:"
echo " - apt-get update -y"
echo " - apt-get install apt-file -y"
echo " - apt-file update -y"
echo " - apt-get install sudo -y"
echo " - apt install vim -y"
echo " - apt update -y"
echo " - apt upgrade -y"
echo "Example configuration: 8.Europe | 1.Amsterdam | 27.UTF-8 | 23. Guess optimal character set | ENTER"

echo "We are assuming you are running this with '. ./setup.sh' and that you have enough space for this"
echo "Hit Ctr-C if you just changed your mind"
while true; do
    echo "Choose [Yy]* for Yes, or [Nn]* for No or just pure Ctr-C if you want to cancel."
    read -r -p "Do you want to proceed ?" yng
    case $yng in
        [Yy]* ) break;;
        [Nn]* ) echo "You bailed out!"; exit;;
        * )
    esac
done

echo "- Performing update..."
sudo apt update -y
sudo apt upgrade -y
echo "- Update complete!"

echo "- Dev tools installation..."
sudo apt install curl -y
sudo apt install gpg -y
sudo apt install apt-transport-https -y
sudo apt upgrade -y
sudo apt update -y
echo "- Dev tools installation complete!"

echo "- Cyber security installation..."
sudo apt install ecryptfs-utils cryptsetup -y
sudo apt install ca-certificates apt-transport-https -y
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
sudo apt upgrade -y
sudo apt update -y
echo "- Cyber security installation complete!"

echo "- Repo setup..."
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
AZ_REPO=$(lsb_release -cs)
sudo apt update -y
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt upgrade -y
sudo apt update -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |
    sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
sudo apt update -y
sudo apt upgrade -y
echo "- Repo setup complete!"

echo "- Dev tools installation..."
sudo apt install git -y
sudo apt install git-gui -y
sudo apt install gitk -y
sudo apt install maven -y
sudo apt install wget -y
sudo apt install vim -y
sudo apt install nano -y
sudo apt install pip -y
sudo apt install ssh -y
sudo apt install python3.7 -y
sudo apt install python3-pip
sudo apt install zip -y
sudo apt install unzip -y
sudo apt install jq -y
sudo apt install npm -y
sudo apt install zsh -y
sudo apt-get install gh -y
sudo apt-get install fonts-powerline -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
sudo apt install evdi-dkms -y
sudo apt upgrade -y
sudo apt update -y
sudo apt-get install postgresql-client -y
echo "* Installing operating system update manager..."
sudo apt-get install update-manager-core -y
echo "* Installing sound controls..."
sudo apt-get install pavucontrol -y
echo "- Dev tools installation complete!"

echo "- Library installation..."
sudo apt install autoconf -y
sudo apt install autoconf-archive -y
sudo apt install gnupg -y
sudo apt install g++ -y
sudo apt install libglib2.0-dev -y
sudo apt install libxml2-dev -y
sudo apt install gtk-doc-tools -y
sudo apt install libupower-glib-dev -y
sudo apt install liblzma-dev -y
sudo apt install libevdev-dev -y
sudo apt install dbus -y
sudo apt install libdbus-1-dev -y
sudo apt install build-essential libdbus-glib-1-dev libgirepository1.0-dev libpython3-dev libdbus-1-dev -y
sudo apt upgrade -y
sudo apt update -y
echo "- Library installation complete!"

echo "- Cloud tools installation..."
sudo apt install pipenv -y
sudo apt install awscli -y
sudo apt install ntfs-3g -y
sudo apt install lsb-release -y
sudo apt-get install azure-cli -y
sudo apt update -y
sudo apt upgrade -y
echo "- Cloud tools installation complete!"

echo "- Virtualization tools installation..."
sudo apt install docker -y
sudo apt install docker-compose -y
sudo apt install docker.io -y
sudo apt install docker-ce docker-ce-cli containerd -y
sudo apt install containerd.io -y
sudo apt install gparted -y
sudo apt upgrade -y
sudo apt update -y
sudo apt-get install libfuse3-3 -y
sudo apt autoremove -y

echo "- Virtualization tools installation complete!"

echo "- Python installations..."
pip install flask
pip install futures
pip install pebble
pip install pika
pip install coapthon
pip install paho-mqtt
pip install kafka-python
pip install requests
pip install netifaces
pip install awslogs
pip install awscli
pip install locust
pip3 install --upgrade pip
pip3 install --upgrade awscli
echo "- Python installs complete!"

sudo apt upgrade -y
sudo apt update -y

sudo usermod -aG docker $USER

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install java 8.0.302-open
yes | sdk install java 11.0.11.hs-adpt
yes | sdk install java 12.0.2.hs-adpt
yes | sdk install java 16.0.1.hs-adpt
yes | sdk install java 17.0.4.1-zulu
yes | sdk install java 18.0.2-open
yes | sdk install java 19.0.2-open
yes | sdk install java 20.0.1-open
yes | sdk install java 21.0.1.crac-zulu
yes | sdk install java 21.0.1-tem
yes | sdk install sbt
yes | sdk install gradle
yes | sdk install kotlin
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
