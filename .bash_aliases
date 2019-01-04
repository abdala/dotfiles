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
alias softphp="drunv softcom/php php"
alias php56="drunv php:5.6-alpine php"
alias composer="drunv -v /opt/composer:/composer kalayaan/php composer"
alias box="drunv kalayaan/php box"
alias softserv="drunv -e APPLICATION_ENV=development -p 8081:8081 softcom/php php -S 0.0.0.0:8081 -t public"

phps() { drunv -p $1:$1 kalayaan/php php -S 0.0.0.0:$1 -t ${2:-'public/'}; }

# Node & npm
#alias node='drunv kalayaan/cordova node'
#alias npm='drunv kalayaan/node npm'
alias tldr='drun node:alpine tldr'
alias asciilang='drun kalayaan/node asciilang'
#alias cordova='drunv -p 8000:8000 kalayaan/node cordova'
#alias ionic="drun -p 8100:8100 -p 35729:35729 --privileged -v /dev/bus/usb:/dev/bus/usb -v ~/.gradle:/root/.gradle -v \$PWD:/myApp:rw agileek/ionic-framework ionic"
#alias cordova="drun -p 8100:8100 -p 8000:8000 -p 35729:35729 --privileged -v /dev/bus/usb:/dev/bus/usb -v ~/.gradle:/root/.gradle -v \$PWD:/myApp:rw agileek/ionic-framework cordova"
#alias adb="drun --privileged -v /dev/bus/usb:/dev/bus/usb -v ~/.gradle:/root/.gradle -v \$PWD:/myApp:rw agileek/ionic-framework adb"

# Cordova & Ionic
alias node='drunv kalayaan/cordova node'
alias npm='drunv kalayaan/cordova npm'
alias cordova="drun -p 8100:8100 -p 8000:8000 -p 35729:35729 --privileged -v /dev/bus/usb:/dev/bus/usb -v ~/.gradle:/root/.gradle -v \$PWD:/myApp:rw kalayaan/cordova cordova"
alias ionic="drun -p 8100:8100 -p 35729:35729 --privileged -v /dev/bus/usb:/dev/bus/usb -v ~/.gradle:/root/.gradle -v \$PWD:/myApp:rw -w /myApp kalayaan/cordova ionic"
alias tsc='drunv kalayaan/cordova tsc'
alias adb="drun --privileged -v /dev/bus/usb:/dev/bus/usb -v ~/.gradle:/root/.gradle -v \$PWD:/myApp:rw kalayaan/cordova adb"

# Ruby & gem
alias ruby='drunv kalayaan/ruby ruby'
alias gem='drunv kalayaan/ruby gem'
alias jekyll='drunv -p 4000:4000 kalayaan/ruby jekyll'
alias sass='drunv kalayaan/ruby sass'
