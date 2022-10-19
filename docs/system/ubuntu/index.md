# Ubuntu installation

## Download install script

For some docker images you may need to run:

```bash
apt-get update -y
apt-get install apt-file -y
apt-file update -y
apt-get install sudo -y
apt install vim -y
apt install curl -y
apt update -y
apt upgrade -y
```

To download and run [setup.sh](https://github.com/jesperancinha/jeorg-cloud-test-drives/blob/main/docs/system/ubuntu/setup.sh):

```bash
curl https://raw.githubusercontent.com/jesperancinha/jeorg-cloud-test-drives/main/docs/system/ubuntu/setup.sh -o setup.sh
chmod +x setup.sh	
. ./setup.sh
```

`Example configuration: 8.Europe | 1.Amsterdam | 27.UTF-8 | 23. Guess optimal character set | ENTER`

## Docker

```bash
docker it -exec <CONTAINERID> bash # bash into running container
docker stop $(docker ps -a -q) # stops all containers
docker system prune -a # remove everything
docker stop $(docker ps -a -q) && docker system prune -a
```

## ZSH Shell

The command line installation will install all needed libraries.
My preferred style is Agnoster:

```bash
ZSH_THEME="agnoster" # (this is one of the fancy ones)
# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster
```

For this, [Powerline](https://github.com/powerline/fonts) fonts are probably required to be installed. In Ubuntu, the bash script already does this for you.

## Install the latest Ubuntu version

```shell
sudo do-release-upgrade -d
```

## Disabling Wayland login

The new Ubuntu versions have a login that may influence applications such as Microsoft Teams. There is an issue reported where users are not allowed to share screens in the teams_1.4.00.26453 version. To solve that we can just disable Wayland login and default back to Xorg Login:

1. Edit file `/etc/gdm3/custom.conf`.

```shell
sudo vim /etc/gdm3/custom.conf
```

2. Disable Wayland

```properties
[daemon]
# Uncomment the line below to force the login screen to use Xorg
WaylandEnable=false
```

## Microphone issues

When changing Ubuntu versions, we hope for the best and frequently we do get the best, but in some cases we get some bugs and it is not always clear if they come out of the new operating system or out some outdated library. I had issues once with the microphone and I was able to fix this easily using this library:

```bash
sudo apt-get install pavucontrol
pavucontrol
```

In the `Input Devices`, you then have to unlock all channels and select your microphone. I recommend a computer restart after this.


## Get rid of ERR_NETWORK_CHANGED errors in Chrome

I got this error very frequently in the Ubuntu Jammy Jellyfish version of Linux Ubuntu (You know which on it [is](https://cdimage.ubuntu.com/daily-live/current/jammy-desktop-amd64.iso)). The only way I found to solve this was to disable IPv6 on a system level:

```shell
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
```
## Router not connecting to internet

It may become a surprise to you (or not...) that docker can sometimes break up your internet connection due to the docker networks you create. In these cases, just remove all the networks with this simple command:

```shell
docker network prune
```
## Turn displays on

```shell
xrandr --auto
```

>If this doesn't work, please check the more extended command sequence [here](./aliases.md).

## KDE Not being installed

Try using tasksel:

```bash
sudo apt install tasksel -y
tasksel
```
From the menu, just chose your chosen KDE distribution.

## Too many files opened on Cypress and related errors

Cypress uses file notifications and listeners on a massive scale. In their issue number [16849](https://github.com/cypress-io/cypress/issues/16849), they describe a working solution:

1. Go to file `/etc/sysctl.conf` on your system.

2. Double your `fs.inotify.max_user_instances` (i.e. `fs.inotify.max_user_instances = 256`). If this parameter does not exist, please add it.

If this doesn't work, then you can try this:

```shell
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
cat /proc/sys/fs/inotify/max_user_watches
```

```shell
echo fs.inotify.max_user_watches=8192 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
cat /proc/sys/fs/inotify/max_user_watches
```

```shell
echo fs.inotify.max_user_watches=16384 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
cat /proc/sys/fs/inotify/max_user_watches
```

```shell
echo fs.inotify.max_user_watches=32768 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
cat /proc/sys/fs/inotify/max_user_watches
```

```shell
echo fs.inotify.max_user_watches=32768 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
cat /proc/sys/fs/inotify/max_user_watches
```

```shell
echo fs.inotify.max_user_watches=65536 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
cat /proc/sys/fs/inotify/max_user_watches
```

> NOTE: Please double check /etc/sysctl.conf. This code may generate multiple `max_user_watches`. Make sure to leave only the last one.
> `sudo vim /etc/sysctl.conf`
[source](https://stackoverflow.com/questions/55763428/react-native-error-enospc-system-limit-for-number-of-file-watchers-reached)

## Aliases

There are several handy aliases that we can make. The most useful that I've used can be seen [here](./aliases.md).

## DNS Issues

For DNS Issues I have created a whole document about it here [DNS R&D](./dns/Readme.md).

## References

-   [Regularly getting ERR_NETWORK_CHANGED errors in Chrome](https://superuser.com/questions/747735/regularly-getting-err-network-changed-errors-in-chrome)
-   [Powerline Fonts](https://github.com/powerline/fonts)
-   [ohmyzsh on GitHub](https://github.com/ohmyzsh/ohmyzsh)
-   [Agnoster ZSH Theme](https://github.com/agnoster/agnoster-zsh-theme)
-   [Brave for Linux](https://brave.com/linux/#linux)
-   [Oh My Z](https://ohmyz.sh/)
-   [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
-   [intel/thermal_daemon](https://github.com/intel/thermal_daemon)
-   [extremely useful docker commands](https://www.codenotary.com/blog/extremely-useful-docker-commands/)
-   [Install the Azure CLI on Linux](https://docs.microsoft.com/nl-nl/cli/azure/install-azure-cli-linux?pivots=apt)
-   [Difference Between apt and apt-get Explained](https://itsfoss.com/apt-vs-apt-get-difference/)
-   [Ubuntu on chrome book](https://ubuntu.com/tutorials/install-ubuntu-on-chromebook#1-overview)
