# Ubuntu Chrome (Tested on ACER C302C)

The whole concept of installing System in chrome is to disable OS system verification.
This can be done permanently by removing the check via hardware or just skipping the reminding everytime you log in. `Ctr-D` is then your most common combination using Chrome Book in Dev mode.

1. Turn Laptop off
2. Press `Esc`, `Refresh` and then `Power Button`. The latter is located either on the keyboard or on the left side. Check the right side if it is not found on the left.
3. Press `Ctrl-D`
4. Accept `turn OS verification OFF`. Press `Enter`
5  Press `Ctr-D`
6. Wait for installation to complete
7. Wait for restart to complete
8. Press `Ctr-D` again
9. Finish installation steps
10. Use `Ctr-Alt-T` to summon `crosh` (Chrome Shell)
11. `shell`
12. Download script [crouton](https://goo.gl/fd3zc) and save it in the downloads folder
13. We need to copy `crouton` [to a place where we can execute it](https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md).

	```bash
	sudo mount /var -o remount,exec
	sudo cp ~/Downloads/crouton /var
	sudo sh /var/crouton -t unity
	```

14. Start Ubuntu

	```bash
	sudo startunity
	```

15. Use `Ctrl-Alt-Shift-Back` and `Ctrl-Alt-Shift-Forward` to exchange systems

## [Remove warning Dev screen](https://gist.github.com/CoolOppo/183f42eef4e5cab328d7)

-- BE VERY CAREFUL HERE --

The danger here, is that depending on your notebook mode, is of course that it can end up getting bricked.
In other words, if this doesn't work, you could potentially reach a point of no return where the computer gets bricked.
Please read the [original documentation](https://gist.github.com/CoolOppo/183f42eef4e5cab328d7) about this for more info, so that you can make a conscious and informed decision.

```bash
sudo -s
cd ~/Downloads
flashrom -r bios.bin
gbb_utility --set --flags=0x01 bios.bin bios.new
flashrom -w bios.new
```

If you see that something is wrong, but you still have access to the `shell`, you can try to revert your changes by writing the original dump:

```bash
flashrom -w bios.bin
sudo rm -rf /usr/local/chroots/xenial
```

Note that reverting this change isn't done in a trivial way. You really need to revert everything. So you need to go back to normal mode, let Chrome OS make all the updates, before you can go back to the developer mode with the OS verification turned off.

## Others

```bash
sudo sh /var/crouton -r list
enter-chroot
sudo mount /var -o remount,exec
sudo sh /var/crouton -t unity -u
```

## Performing updates

We have these options to choose from operating systems among others: `xfce` and `unity`. They can be started with commands `startxfce4` and `startunity` respectively.

However, we sometimes may need to do workarounds. Luckily we don't have to load the full system.
If we issue this command we can get into our OS and perform the necessary workarounds:

```bash
sudo enter-chroot [-n chrootname]
```

## Issues

#### Ubuntu Unity - No Desktop

In the browser `shell`:

```bash
sudo enter-chroot
sudo apt-get install --reinstall ubuntu-desktop
```

#### Write protected mode off

To turn the C302C Google Notebook write protection off, we need to open it up. There is a hidden screw under a tape that holds the chassis against touching the circuit board.
I advise against using this. I couldn't do anything with it, and the risk bricking the computer is quite high. Nothing ever happened to me, but fair warning that the risk is there.
In any case I write this just for general knowledge.

[![alt text](https://raw.githubusercontent.com/jesperancinha/jeorg-cloud-test-drives/main/docs/system/ubuntu-chrome/C302C.jpg "Asus Chromebook C302C")]()

## Medium article

If you would like to see a better example on how this extra system installation please check my article on medium:

[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-20/medium-20.png "Medium")](https://medium.com/swlh/chrome-os-guide-to-go-from-zero-to-devops-hero-in-a-nutshell-f66c4bc5782f)
[Chrome OS Guide to go from Zero to DevOps Hero in a nutshell](https://medium.com/swlh/chrome-os-guide-to-go-from-zero-to-devops-hero-in-a-nutshell-f66c4bc5782f)

[![alt text](./images/articles.zero.to.hero.intro..jpeg)]()

## References

-   [Neutering the “developer mode” screen on your Chromebook](https://gist.github.com/CoolOppo/183f42eef4e5cab328d7)
-   [Ubuntu on chrome book](https://ubuntu.com/tutorials/install-ubuntu-on-chromebook#1-overview)
-   [How I turned an old Chromebook Pixel into a native Linux laptop running Ubuntu](https://www.aboutchromebooks.com/news/how-to-turn-an-old-chromebook-pixel-into-native-linux-ubuntu-laptop/)
-   [Shell scripts & noexec mounts](https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md)
