# JEOrg Cloud Test Drives

## Stop IntelliJ Comman Line in Linux

1. Normal

```shell
ps -aux | grep /share/JetBrains | cut -d" " -f3 | xargs -I {} kill -9 {}
```

2. Force

```shell
ps -aux | grep /share/JetBrains | cut -d" " -f3 | xargs -I {} kill {}
```

