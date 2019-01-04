# Docker
alias dpa='docker ps -a'
alias drun='docker run -it --rm'
alias drunv='drun -v /home/kalayaan:/home/kalayaan -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro --user $(id -u):$(id -g) -v `pwd`:/app -w /app'
alias docker_garbage='docker rmi $* $(docker images -q -f "dangling=true")'
alias dip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" $*'
alias drm='docker rm -v $* $(docker ps -q -f "status=exited")'
alias alpine='drun alpine:3.8'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

dbu() { docker build -t=$1 .; }
dalias() { alias | grep 'docker\|drun\|dvrun' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
dsh() { docker exec -it $(docker ps -aqf "name=$1") sh; }
dexec() { docker exec -it $(docker ps -aqf "name=$1") $2; }

#MySQL
dmysql() { docker run -d -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=$1 --name mysql_$1 mysql; }

# PHP & Composer
alias php56="drunv php:5.6-alpine php"
alias composer="drunv -v /opt/composer:/composer kalayaan/php composer"
alias box="drunv kalayaan/php box"

phps() { drunv -p $1:$1 kalayaan/php php -S 0.0.0.0:$1 -t ${2:-'public/'}; }

# Ruby & gem
alias ruby='drunv kalayaan/ruby ruby'
alias gem='drunv kalayaan/ruby gem'
alias jekyll='drunv -p 4000:4000 kalayaan/ruby jekyll'
alias sass='drunv kalayaan/ruby sass'
