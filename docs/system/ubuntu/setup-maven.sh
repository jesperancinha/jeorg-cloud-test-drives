#!/bin/bash
wget https://www-us.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp
sudo tar xf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt
sudo unlink /opt/maven
sudo ln -s /opt/apache-maven-3.6.3 /opt/maven
sudo echo "export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}" >> maven.sh
sudo mv maven.sh /etc/profile.d/
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
