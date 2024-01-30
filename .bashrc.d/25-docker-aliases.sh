# bash_aliases.sh: Bash aliases for Docker

alias docker-run-cwd='docker run -v $PWD:$PWD --workdir "$PWD" --user $(id -u):$(id -g) --rm'
alias docker-root-run-cwd='docker run -v $PWD:$PWD --workdir "$PWD" --user 0:0 --rm'
alias docker-cmake-build='docker run -v $PWD/..:$PWD/.. --workdir "$PWD" --user $(id -u):$(id -g) --rm'

# vim: set ft=sh :
