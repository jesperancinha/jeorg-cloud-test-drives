# Cleanup up your system

## SDKMAN

SDKMAN may occupy a large space in your machine. It installs versions on demand and caches them.

However, in the long run, you may not be aware that some old versions are still taking up space in your machine.

You can find these folders in `~/.sdkman/candidates` and `~/.sdkman/archives`.

To remove them in one go, you can use these scripts:

```shell
rm -rf ~/.sdkman/candidates
rm -rf ~/.sdkman/archives
```

Use the above commands only when you are sure you want to get rid of everything and start fresh.

## Lost JDKS

### MAC-OS

Sometimes, when we install applications or try out a few commands, we can inadvertently trigger an installation of some Java JDK.
They are usually located in /Library/Java/JavaVirtualMachines/. If you are sure you don't need them, you can just remove then and save even more space.

```bash
sudo rm -rf /Library/Java/JavaVirtualMachines/* 
```

## Docker

A great deal of space can get to be used by docker. The best thing to do is to delete everything via Docker Desktop.

However, if you prefer the command line, you can just run:

```shell
docker system prune -a
docker builder prune
docker system prune --all --force --volumes
```

## Remove postgres

### Mac-OS

```shell
cd /Library/PostgreSQL/11
cd /Library/PostgreSQL/13
open open uninstall-postgres.app
```

## /tmp/

The `/tmp` folder can take up tremendous amounts of space. This is the reason you should clean it up regularly

## Download

The download folder is a far less obvious place to look at, but it may just be that old installation files are still lying there.

## Git Compress

Git uses object that are meant to optimize its usage. Some of these objects are not needed at some point. To clean them you can use the following:

```shell
git gc --prune
```

or its heavier counter-part:

```shell
git gc --aggressive
```
