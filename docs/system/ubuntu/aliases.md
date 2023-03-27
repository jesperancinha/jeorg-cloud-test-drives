# Ubuntu Aliases

---

## Prune Docker Container and Images

>NOTE: For correct usage of the commands bellow, please check the source [aliases.md](https://github.com/jesperancinha/jeorg-cloud-test-drives/blob/main/docs/system/ubuntu/aliases.md) file directly.

#### 1. Disconnect lost endpoints (not thoroughly tested/last resort)

```shell
for network in $(docker network ls | awk '{print $2}' | grep -v bridge | grep -v ID | grep -v none | grep -v host); do
    for endpoint in $(docker network inspect buy-odd-yucca-concert_yucca-net | grep EndpointID | awk '{print $2}' | sed 's/"//g' | sed 's/,//g'); do
      echo $network $endpoint
      docker network disconnect -f $network $endpoint
    done
done
```

#### 2. Removes all docker containers and networks

Removes with prompt

```shell
alias docker-prune='docker ps -a --format ''{{.ID}}'' | xargs -I {}  docker stop {} &&
        docker ps -a --format ''{{.ID}}'' | xargs -I {}  docker rm {} &&
        docker network prune &&
        docker system prune --all &&
        docker builder prune &&
        docker system prune --all --volumes &&
        docker volume ls -qf dangling=true | xargs -I {} docker volume rm  {}'
```

Removes without prompt

```shell
alias docker-prune='docker ps -a --format ''{{.ID}}'' | xargs -I {}  docker stop {} &&
        docker ps -a --format ''{{.ID}}'' | xargs -I {}  docker rm {} &&
        docker network prune -f &&
        docker system prune --all -f &&
        docker builder prune -f &&
        docker system prune --all --volumes -f'
```

---

## Git Pull all Root projects

```shell
alias git-pull='for f in *; do
    if [ -d "$f" ]; then
        cd $f && git pull && git fetch -p && git pull --tags && cd ..
    fi
done'
```

---

## Git build all Root projects

```shell
alias git-build='for f in *; do
    if [ -d "$f" ]; then
        cd $f
        git pull && git fetch -p && git pull --tags
        if [ -f "pom.xml" ]; then
            mvn clean install -Dskip.dependency.check=true -Dmaven.test.skip=true
        fi
        cd ..
    fi
done'
```

---

## Git re-tag

```shell
alias git-re-tag='_git-re-tag() {
                   git tag "$2" "$1" &&
                   git tag -d "$1" &&
                   git push origin :refs/tags/"$1" &&
                   git push --tags &&
                   git pull --prune --tags }; _git-re-tag'
```

---

## Update all pip dependencies

```shell
alias pip-upgrade='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
```
>Credits: [How To Update All Python Packages](https://www.activestate.com/resources/quick-reads/how-to-update-all-python-packages/)

## Activate all monitors

```shell
alias monitors-up='xrandr | grep DP | cut -d" " -f1 | xargs -I {} xrandr --output {} --auto && xrandr --auto'
```

---

## Quick Maven Build

```shell
alias mvn-quick='mvn clean install -Dskip.dependency.check=true -Dmaven.test.skip=true'
```

## Docker

#### 1. stop all containers

```shell
alias docker-stop-all='docker ps -a --format '{{.ID}}' | xargs -I {}  docker stop {}'
```

#### 2. remove all containers

```shell
alias docker-rm-all='docker ps -a --format '{{.ID}}' | xargs -I {}  docker rm {}'
```
