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

## References

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
