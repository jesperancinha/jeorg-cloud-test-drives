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


- Open a tunnel from your machine to the world with `ngrok`


```shell
ngrok http 4000
```

NOTE: Do not try this command without knowing before hand what you are doing.
In our example, all the exposed local content on port 4000  will be exposed worldwide via port 4000.
We are essentially serving all local port input and output traffic to the WWW. You will get a temporary url and that can be used through a tunnel worldwide to reach your machine.

>[Expose a local web server to the internet](https://ngrok.com/docs)
>[Abusing Ngrok: Hackers at the End of the Tunnel](https://www.huntress.com/blog/abusing-ngrok-hackers-at-the-end-of-the-tunnel)