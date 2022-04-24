# Ubuntu Aliases

## Prune Docker Container and Images

#### 1. Disconnect lost endpoints (not thoroughly tested/last resort)

```shell
alias docker-prune-lost-endpoints=`for network in $(docker network ls | awk '{print $2}' | grep -v bridge | grep -v ID | grep -v none | grep -v host); do
  								for endpoint in $(docker network inspect buy-odd-yucca-concert_yucca-net | grep EndpointID | awk '{print $2}' | sed 's/"//g' | sed 's/,//g'); do
  											echo $network $endpoint
  											docker network disconnect -f $network $endpoint
  									done
								done`)
```

#### 2. Removes all docker containers and networks

```shell
alias docker-prune='docker ps -a --format ''{{.ID}}'' | xargs -I {}  docker stop {} &&
        docker ps -a --format ''{{.ID}}'' | xargs -I {}  docker rm {} &&
        docker network prune &&
        docker system prune --all &&
        docker builder prune &&
        docker system prune --all --volumes'
```

## Git Pull all Root projects

```shell
alias git-pull='for f in *; do
    if [ -d "$f" ]; then
        cd $f && git pull && git fetch -p && cd ..
    fi
done'
```

## Git re-tag

```shell
alias git-re-tag='_git-re-tag() {
																		git tag "$2" "$1" &&
																		git tag -d "$1" &&
																		git push origin :refs/tags/"$1" &&
																		git push --tags &&
																		git pull --prune --tags }; _git-re-tag'
```
