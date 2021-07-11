# Commands

This is a list a command that have proven to be very useful to me ao far.
They are very random and they have served different purposes so far.
Search for the ones you are looking for in your browser.
I provide the command, and the description on how it was used.

-   Check your history for all apt installs done in an ubuntu machine:

```bash
history | grep "sudo apt" | grep -v "history" | cut -d' ' -f6-10 | tr -s "[:blank:]"
```

-   Prepare IntelliJ in environments such as Unity under Chrome OS

```bash
sudo mkdir /home/<owner>/.cache/JetBrains/IntelliJIdea2021.1
sudo chown <owner>:<group> /home/<owner>/.cache/JetBrains/IntelliJIdea2021.1/
```
