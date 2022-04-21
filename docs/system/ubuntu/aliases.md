# Ubuntu Aliases

## Prune Docker Container and Images

```shell
alias docker-prune='docker ps -a | xargs -I {}  docker stop {}
        docker ps -a | xargs -I {}  docker rm {}
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
