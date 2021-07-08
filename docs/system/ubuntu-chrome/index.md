# Ubuntu Chrome

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


## References

-   [Ubuntu on chrome book](https://ubuntu.com/tutorials/install-ubuntu-on-chromebook#1-overview)
-   [How I turned an old Chromebook Pixel into a native Linux laptop running Ubuntu](https://www.aboutchromebooks.com/news/how-to-turn-an-old-chromebook-pixel-into-native-linux-ubuntu-laptop/)
-   [Shell scripts & noexec mounts](https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md)
