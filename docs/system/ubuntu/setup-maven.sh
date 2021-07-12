#!/bin/bash
wget https://www-us.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp
sudo tar xf /tmp/apache-maven-*.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.6.3 /opt/maven
echo "export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven" >> /etc/profile.d/maven.sh
sudo chmod +x /etc/profile.d/maven.sh
