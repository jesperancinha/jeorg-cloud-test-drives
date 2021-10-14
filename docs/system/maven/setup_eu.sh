#!/bin/bash
echo "from https://computingforgeeks.com/install-latest-apache-maven-on-ubuntu-debian/"
export MAVEN_VERSION="3.8.3"
wget http://www-eu.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
tar xvf apache-maven-${MAVEN_VERSION}-bin.tar.gz
sudo mv apache-maven-${MAVEN_VERSION} /opt/maven
cat <<EOF | sudo tee /etc/profile.d/maven.sh
export MAVEN_HOME=/opt/maven
export PATH=\$MAVEN_HOME/bin:\$PATH
EOF
source /etc/profile.d/maven.sh
rm -r apache*