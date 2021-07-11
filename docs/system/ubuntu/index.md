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

## References

-   [Install the Azure CLI on Linux](https://docs.microsoft.com/nl-nl/cli/azure/install-azure-cli-linux?pivots=apt)
-   [Difference Between apt and apt-get Explained](https://itsfoss.com/apt-vs-apt-get-difference/)
-   [Ubuntu on chrome book](https://ubuntu.com/tutorials/install-ubuntu-on-chromebook#1-overview)
