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

## /tmp/

The `/tmp` folder can take up tremendous amounts of space. This is the reason you should clean it up regularly

## Download

The download folder is a far less obvious place to look at, but it may just be that old installation files are still lying there.
