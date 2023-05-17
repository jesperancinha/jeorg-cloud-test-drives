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

## Git build all Root projects with Failsafe skip

```shell
alias git-build-failsafe-skip='for f in *; do
    if [ -d "$f" ]; then
        cd $f
        git pull && git fetch -p && git pull --tags
        if [ -f "pom.xml" ]; then
            mvn clean install -Dskip.integration.tests=true -Dskip.unit.tests=true -Dskip.dependency.check=true
        fi
        cd ..
    fi
done'
```

---

## Git Resolve all dependencies from the projects root

```shell
alias git-resolve='for f in *; do
    if [ -d "$f" ]; then
        cd $f
        git pull && git fetch -p && git pull --tags
        if [ -f "pom.xml" ]; then
            mvn dependency:resolve
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

## Keep Playing

> This allows any audio player to keep playing in spite of system notifications

```shell
alias keep-playing='pactl unload-module module-role-cork'
```

#### References

-   https://community.spotify.com/t5/Desktop-Linux/Spotify-mutes-itself-when-system-sounds-play-SOLUTION/td-p/4581978

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

## Upgrades

## Upgrade Everything

```shell
alias upgrade-all='echo "$(tput setaf 2)Starting upgrade..."; \
  echo "$(tput setaf 7)"; \
  export SDKMAN_DIR="$HOME/.sdkman"; \
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; \
  source "$HOME/.sdkman/bin/sdkman-init.sh"; \
  sdk update; \
  sbtVersion=$(sbt --version | tail -n 1 | cut -f4 -d" "); \
  if [[ -z "$sbtVersion" ]]; then \
     sdk install sbt $SBT_VERSION; \
     sdk use gradle $SBT_VERSION; \
  else \
     (yes "" 2>/dev/null || true) | sdk install sbt; \
  fi; \
  export SBT_VERSION=$(sbt --version | tail -n 1 | cut -f4 -d" "); \
  echo "Installed sbt $SBT_VERSION"; \
  export SDKMAN_DIR="$HOME/.sdkman"; \
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; \
  source "$HOME/.sdkman/bin/sdkman-init.sh"; \
  sdk update; \
  gradleOnlineVersion=$(curl -s https://services.gradle.org/versions/current | jq .version | xargs -I {} echo {}); \
  if [[ -z "$gradleOnlineVersion" ]]; then \
     sdk install gradle; \
  else \
     sdk install gradle $gradleOnlineVersion; \
     sdk use gradle $gradleOnlineVersion; \
  fi; \
  echo "Installed gradle $gradleOnlineVersion"; \
  sudo apt autoremove; \
  sudo apt upgrade; \
  sudo apt update; \
  sudo apt-get dist-upgrade; \
  sudo apt-get --with-new-pkgs upgrade; \
  sudo apt upgrade --fix-missing; \
  sudo apt update --fix-missing; \
  sudo apt install fwupd; \
  sudo apt autoremove; \
  sudo service fwupd start; \
  sudo fwupdmgr refresh; \
  fwupdmgr get-updates; \
  fwupdmgr update; \
  apt list --upgradable -a; \
  echo "$(tput setaf 4)Finished Upgrade!"; \
  '
```

## Docker update

From the [documentation](https://docs.docker.com/compose/install/linux/#install-using-the-repository), we see that it is easy as:

```shell
sudo apt-get update
sudo apt-get install docker-compose-plugin
```

However, this never worked for me. This alias, however, did:

```shell
alias upgrade-docker-manually='
    echo "$(tput setaf 2)Starting upgrade from docker-compose version $(docker-compose -v | tail -n 1)"; \
    echo "If DOCKER_COMPOSE_VERSION env variable is not given, this upgrade will install the latest version"; \
    if [[ -z "$DOCKER_COMPOSE_VERSION" ]]; then \
        DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4); \
    else \
        echo "$(tput setaf 1)DOCKER_COMPOSE_VERSION not given. Upgrading to latest available version..."; \
    fi; \
    echo "$(tput setaf 2)Installing version $DOCKER_COMPOSE_VERSION of docker-compose"; \
    echo "$(tput setaf 7)"; \
    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}; \
    mkdir -p $DOCKER_CONFIG/cli-plugins; \
    curl -SL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose; \
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose;
    echo "$(tput setaf 4)Finished Upgrade!"; \
    '
```

References:

-   [How to upgrade docker-compose to latest version](https://stackoverflow.com/questions/49839028/how-to-upgrade-docker-compose-to-latest-version)
-   [GIST deviantony/install-latest-compose.sh](https://gist.github.com/deviantony/2b5078fe1675a5fedabf1de3d1f2652a)
