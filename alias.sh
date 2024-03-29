alias docker_build='docker-build.sh'
alias docker_cc='docker rm -f $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker_ci='docker rmi -f $(docker images -a --filter=dangling=true -q)'
alias docker_clean='docker_cc && docker_ci'
alias docker_exec='docker exec -it `docker ps -q -l` "/bin/bash"'
alias docker_purge='docker rm -f $(docker ps -aq)'
