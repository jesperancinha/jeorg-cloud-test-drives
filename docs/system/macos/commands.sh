# Do NOT RUN this script standalone
# Choose between
# 1 - setup.sh => BASH Script
# 2 - setup.zsh => ZSH Script
echo "- Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "- Brew Install complete!"

echo "- Performing update..."
brew update
brew upgrade
echo "- Update complete!"

echo "- Dev tools installation..."
brew install wget
brew install curl
brew install gnupg
brew install git
brew install git-gui
brew install maven
brew install vim
brew install nano
brew install python
brew install zip
brew install unzip
brew install python@3.7
brew install jq
brew install zsh
echo "- Dev tools installation complete!"

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
echo "- Python installs complete!"

echo "- Performing update..."
brew update
brew upgrade
echo "- Update complete!"

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 11.0.11.hs-adpt
sdk install sbt
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
