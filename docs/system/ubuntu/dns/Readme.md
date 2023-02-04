# DNS Issues

## Problem
The following is a list of commands used to try and fix a known issues with DNS and Ubuntu.

Some versions of Ubuntu get to have a wrong configuration where the DNS service isn't able to resolve the IP's of the servers.
For that, there are several solutions presented online but none as a fixed solution.

The problem resolution can depend on several factors:

1.  The Kernel version
2.  The System
3.  The CPU
4.  The installed software
5.  Anything else.

## Solution

This is a just a list that can be used as a guide to try and pinpoint the origin of the problem and to find a solution. The list is not the solution itself for the problem.
Consider this as a document filled with notes about solving the DNS issue, should you be faced with it at some point.

Wherever you find to configure DNS Servers, I used the official Google DNS servers: `8.8.8.8` and `8.8.4.4`.

Remember to back up any file you try to change. DO NOT remove `network-manager` without reading the last paragraph of this document and ONLY if you know what you are doing.

```shell
sudo apt update
sudo apt upgrade
sudo apt autoremove

# Software that can be installed
sudo apt install network-manager
sudo apt install resolvconf
sudo apt install dnsutils
sudo apt install dnsmasq
sudo apt install nscd
sudo apt install bind9

# A solution presented and distributed around the Blogs and Posts.
sudo rm /etc/resolv.conf
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl restart resolvconf

# An alternative solution presented and distributed around the Blogs and Posts.
sudo rm /etc/resolv.conf
sudo cp /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl restart resolvconf

# A list of files that can be edited to configure the DNS servers
# Check the examples folder for examples. If the example is not available it just means that I did not change the original file in any way.
sudo vim /etc/systemd/resolved.conf
sudo vim /etc/NetworkManager/NetworkManager.conf
sudo vim /etc/resolvconf/resolv.conf.d/head
sudo vim /etc/resolvconf/resolv.conf.d/base
sudo vim /run/systemd/resolve/resolv.conf
sudo vim /etc/dhcp/dhclient.conf
sudo vim /etc/resolv.conf

# A list of files that can be edited to configure the DNS servers
# Check the examples folder for examples. If the example is not available it just means that I did not change the original file in any way.
cat /etc/systemd/resolved.conf
cat /etc/NetworkManager/NetworkManager.conf
cat /etc/resolvconf/resolv.conf.d/head
cat /etc/resolvconf/resolv.conf.d/base
cat /run/systemd/resolve/resolv.conf
cat /etc/dhcp/dhclient.conf
cat /etc/resolv.conf

# Restart elements
sudo netplan apply
sudo dhclient
sudo resolvectl flush-caches
resolvectl dns
sudo systemctl restart resolvconf
sudo systemctl restart NetworkManager
sudo systemctl restart nscd
/etc/init.d/dnsmasq start
sudo systemctl restart bind9.service
```

## Solution

Although the above may help you, the actual solution for me was to:

-   Disable IPv6 configurations:

```shell
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
```

-   Reconfigure Resolvconf

```shell
sudo dpkg-reconfigure resolvconf:
```

-   Remove Docker networks

```shell
docker network prune
```

## Warnings

Only remove `network-manager` if you `REALLY` `REALLY` have to! You may be led to thinking this is one option but consider this:

1.  The removal of this library will stop your computer to be connected to the internet. This applies to both cable and Wi-Fi connections.
2.  Your computer will have no possibility other than via BlueTooth or USB to connect to other device
3.  You can via a mobile phone or usb, the correct network-manager `debian` version download. Make sure to consider if you have `arm`, `amd` or other chips and that the version you download matches your system version.

Removing the `network-manager` could nonetheless be a good idea if everything else fails. Just be sure to have the means to install it again. For example a mobile phone or an usb-drive with the correct saved distribution.

## About me 👨🏽‍💻🚀🏳️‍🌈

[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-20/JEOrgLogo-20.png "João Esperancinha Homepage")](http://joaofilipesabinoesperancinha.nl)
[![GitHub followers](https://img.shields.io/github/followers/jesperancinha.svg?label=Jesperancinha&style=social "GitHub")](https://github.com/jesperancinha)
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-20/mastodon-20.png "Mastodon")](https://masto.ai/@jesperancinha)
[![Twitter Follow](https://img.shields.io/twitter/follow/joaofse?label=João%20Esperancinha&style=social "Twitter")](https://twitter.com/joaofse)
| [Sessionize](https://sessionize.com/joao-esperancinha/)
| [Spotify](https://open.spotify.com/user/jlnozkcomrxgsaip7yvffpqqm?si=b54b89eae8894960)
| [Medium](https://medium.com/@jofisaes)
| [Buy me a coffee](https://www.buymeacoffee.com/jesperancinha)
| [Credly Badges](https://www.credly.com/users/joao-esperancinha)
| [Google Apps](https://play.google.com/store/apps/developer?id=Joao+Filipe+Sabino+Esperancinha)
| [Sonatype Search Repos](https://search.maven.org/search?q=org.jesperancinha)
| [Docker Images](https://hub.docker.com/u/jesperancinha)
| [Stack Overflow Profile](https://stackoverflow.com/users/3702839/joao-esperancinha)
| [Reddit](https://www.reddit.com/user/jesperancinha/)
| [Dev.TO](https://dev.to/jofisaes)
| [Hackernoon](https://hackernoon.com/@jesperancinha)
| [Code Project](https://www.codeproject.com/Members/jesperancinha)
| [BitBucket](https://bitbucket.org/jesperancinha)
| [GitLab](https://gitlab.com/jesperancinha)
| [Coursera](https://www.coursera.org/user/da3ff90299fa9297e283ee8e65364ffb)
| [FreeCodeCamp](https://www.freecodecamp.org/jofisaes)
| [HackerRank](https://www.hackerrank.com/jofisaes)
| [LeetCode](https://leetcode.com/jofisaes)
| [Codebyte](https://coderbyte.com/profile/jesperancinha)
| [CodeWars](https://www.codewars.com/users/jesperancinha)
| [Code Pen](https://codepen.io/jesperancinha)
| [Hacker Earth](https://www.hackerearth.com/@jofisaes)
| [Khan Academy](https://www.khanacademy.org/profile/jofisaes)
| [Hacker News](https://news.ycombinator.com/user?id=jesperancinha)
| [InfoQ](https://www.infoq.com/profile/Joao-Esperancinha.2/)
| [LinkedIn](https://www.linkedin.com/in/joaoesperancinha/)
| [Xing](https://www.xing.com/profile/Joao_Esperancinha/cv)
| [Tumblr](https://jofisaes.tumblr.com/)
| [Pinterest](https://nl.pinterest.com/jesperancinha/)
| [Quora](https://nl.quora.com/profile/Jo%C3%A3o-Esperancinha)
| [VMware Spring Professional 2021](https://www.credly.com/badges/762fa7a4-9cf4-417d-bd29-7e072d74cdb7)
| [Oracle Certified Professional, Java SE 11 Programmer](https://www.credly.com/badges/87609d8e-27c5-45c9-9e42-60a5e9283280)
| [Oracle Certified Professional, JEE7 Developer](https://www.credly.com/badges/27a14e06-f591-4105-91ca-8c3215ef39a2)
| [IBM Cybersecurity Analyst Professional](https://www.credly.com/badges/ad1f4abe-3dfa-4a8c-b3c7-bae4669ad8ce)
| [Certified Advanced JavaScript Developer](https://cancanit.com/certified/1462/)
| [Certified Neo4j Professional](https://graphacademy.neo4j.com/certificates/c279afd7c3988bd727f8b3acb44b87f7504f940aac952495ff827dbfcac024fb.pdf)
| [Deep Learning](https://www.credly.com/badges/8d27e38c-869d-4815-8df3-13762c642d64)
| [![Generic badge](https://img.shields.io/static/v1.svg?label=GitHub&message=JEsperancinhaOrg&color=yellow "jesperancinha.org dependencies")](https://github.com/JEsperancinhaOrg)
[![Generic badge](https://img.shields.io/static/v1.svg?label=All%20Badges&message=Badges&color=red "All badges")](https://joaofilipesabinoesperancinha.nl/badges)
[![Generic badge](https://img.shields.io/static/v1.svg?label=Status&message=Project%20Status&color=red "Project statuses")](https://github.com/jesperancinha/project-signer/blob/master/project-signer-quality/Build.md)
