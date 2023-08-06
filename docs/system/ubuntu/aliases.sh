#!/usr/bin/env sh
alias docker-prune='docker ps -a --format ''{{.ID}}'' | xargs -I {}  docker stop {} &&
        docker ps -a --format ''{{.ID}}'' | xargs -I {}  docker rm {} &&
        docker network prune -f &&
        docker system prune --all -f &&
        docker builder prune -f &&
        docker system prune --all --volumes -f'

alias git-pull='for f in *; do
  if [ -d "$f" ]; then
      cd $f && git pull && git fetch -p && cd ..
  fi
done'

alias pip-upgrade='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
alias monitors-up='xrandr | grep DP | cut -d" " -f1 | xargs -I {} xrandr --output {} --auto && xrandr --auto'
alias mvn-quick='mvn clean install -Dskip.dependency.check=true -Dmaven.test.skip=true'
alias cypress-watches-on='echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p'
alias cypress-watches-off='echo fs.inotify.max_user_watches=5000 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p'
alias docker-stop-all='docker ps -a --format '{{.ID}}' | xargs -I {}  docker stop {}'
alias docker-rm-all='docker ps -a --format '{{.ID}}' | xargs -I {}  docker rm {}'

alias jdk8='sdk use java 8.0.302-open'
alias jdk11='sdk use java 11.0.11.hs-adpt'
alias jdk12='sdk use java 12.0.2.hs-adpt'
alias jdk16='sdk use java 16.0.1.hs-adpt'
alias jdk17='sdk use java 17.0.4.1-zulu'
alias jdk18='sdk use java 18.0.2-open'
alias jdk19='sdk use java 19.0.2-open'
alias jdk20='sdk use java 20.0.1-open'
alias graalVM='sdk use java 22.2.r17-grl'

export ANDROID_HOME=/home/$(whoami)/Android/Sdk

alias upgrade-all-overseer='echo "$(tput setaf 2)Starting upgrade..."; \
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
  sudo apt autoremove -y; \
  sudo apt upgrade -y; \
  sudo apt update -y; \
  sudo apt-get dist-upgrade -y; \
  sudo apt-get --with-new-pkgs upgrade -y; \
  sudo apt upgrade --fix-missing -y; \
  sudo apt update --fix-missing -y; \
  sudo apt install fwupd -y; \
  sudo apt autoremove -y; \
  sudo ubuntu-drivers autoinstall -y; \
  sudo service fwupd start; \
  sudo fwupdmgr refresh; \
  fwupdmgr get-updates; \
  fwupdmgr update; \
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
  apt list --upgradable -a; \
  sudo apt list --upgradable | cut -f1 -d'/' | xargs -I {} sudo apt-get upgrade {} -y; \
  apt list --upgradable -a; \
  echo "$(tput setaf 4)Finished Upgrade!"; \
  '

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
  sudo apt autoremove -y; \
  sudo apt upgrade -y; \
  sudo apt update -y; \
  sudo apt-get dist-upgrade -y; \
  sudo apt-get --with-new-pkgs upgrade -y; \
  sudo apt upgrade --fix-missing -y; \
  sudo apt update --fix-missing -y; \
  sudo apt install fwupd -y; \
  sudo apt autoremove -y; \
  sudo ubuntu-drivers autoinstall -y; \
  sudo service fwupd start; \
  sudo fwupdmgr refresh; \
  fwupdmgr get-updates; \
  fwupdmgr update; \
  apt list --upgradable -a; \
  echo "$(tput setaf 4)Finished Upgrade!"; \
  '

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

alias keep-playing='pactl unload-module module-role-cork'
alias update-drivers='sudo ubuntu-drivers autoinstall'
alias google-dns='sudo echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null'

alias jdk8='sdk use java 8.0.302-open'
alias jdk11='sdk use java 11.0.11.hs-adpt'
alias jdk12='sdk use java 12.0.2.hs-adpt'
alias jdk16='sdk use java 16.0.1.hs-adpt'
alias jdk17='sdk use java 17.0.4.1-zulu'
alias jdk18='sdk use java 18.0.2-open'
alias jdk19='sdk use java 19.0.2-open'
alias jdk20='sdk use java 20.0.1-open'
