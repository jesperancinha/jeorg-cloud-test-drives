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

alias jdk8=sdk use java 8.0.302-open
alias jdk11=sdk use java 11.0.11.hs-adpt
alias jdk12=sdk use java 12.0.2.hs-adpt
alias jdk16=sdk use java 16.0.1.hs-adpt
alias jdk17=sdk use java 17.0.4.1-zulu
alias jdk18=sdk use java 18.0.2-open

export ANDROID_HOME=/home/$(whoami)/Android/Sdk
