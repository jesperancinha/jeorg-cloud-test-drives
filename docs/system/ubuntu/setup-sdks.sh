#!/bin/bash
sdk install java 8.0.302-open
sdk install java 11.0.11.hs-adpt
sdk install java 12.0.2.hs-adpt
sdk install java 16.0.1.hs-adpt
sdk install java 17.0.4.1-zulu
sdk install java 18.0.2-open
sdk install java 22.2.r17-grl

echo "" >> ~/.zshrc
echo alias jdk8="sdk use java 8.0.302-open" >> ~/.zshrc
echo alias jdk11="sdk use java 11.0.11.hs-adpt" >> ~/.zshrc
echo alias jdk12="sdk use java 12.0.2.hs-adpt" >> ~/.zshrc
echo alias jdk16="sdk use java 16.0.1.hs-adpt" >> ~/.zshrc
echo alias jdk17="sdk use java 17.0.4.1-zulu" >> ~/.zshrc
echo alias jdk18="sdk use java 18.0.2-open" >> ~/.zshrc

