# Ubuntu Chrome (Tested on ACER C302C)

The whole concept of installing System in chrome is to disable OS system verification.
This can be done permanently by removing the check via hardware or just skipping the reminding everytime you log in. `Ctr-D` is then your most common combination using Chrome Book in Dev mode.

1. Turn Laptop off
2. Press `Esc`, `Refresh` and then `Power Button`. The latter is located either on the keyboard or on the left side. Check the right side if it is not found on the left.
3. Press `Ctrl-D`
4. Accept `turn OS verification OFF`. Press `Enter`
5. Wait for installation to complete
6. Wait for restart to complete
7. Press `Ctr-D` again
8. Finish installation steps
9. Use `Ctr-Alt-T` to summon `crosh` (Chrome Shell)
10. `shell`
11. Download script [crouton](https://goo.gl/fd3zc) and save it in the downloads folder
12. We need to copy `crouton` [to a place where we can execute it](https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md).

```bash
sudo mount /var -o remount,exec
sudo cp ~/Downloads/crouton /var
sudo sh /var/crouton -t unity
```

13. Start Ubuntu

```bash
sudo startunity
```

14. Use `Ctrl-Alt-Shift-Back` and `Ctrl-Alt-Shift-Forward` to exchange systems

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

## Others

```bash
sudo sh /var/crouton -r list
enter-chroot
sudo mount /var -o remount,exec
sudo sh /var/crouton -t unity -u
```

## References

-   [Neutering the “developer mode” screen on your Chromebook](https://gist.github.com/CoolOppo/183f42eef4e5cab328d7)
-   [Ubuntu on chrome book](https://ubuntu.com/tutorials/install-ubuntu-on-chromebook#1-overview)
-   [How I turned an old Chromebook Pixel into a native Linux laptop running Ubuntu](https://www.aboutchromebooks.com/news/how-to-turn-an-old-chromebook-pixel-into-native-linux-ubuntu-laptop/)
-   [Shell scripts & noexec mounts](https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md)
