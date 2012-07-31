# Init rbenv
eval "$(rbenv init -)"

#Maven
export MAVEN_OPTS="-Xmx1024M -XX:MaxPermSize=256M -Dmaven.tomcat.path=/front -Dlogback.configurationFile=file:/Users/torbjorn/Development/workspace/SG/ff2/front/src/main/resources/logback-torbjorn.xml"
export M3_HOME="/usr/bin/mvn"
export M3="$M3_HOME/bin"
export REPO="$HOME/.m2/repository"

#Akka
export AKKA_HOME=/Applications/typesafe-stack

#Scala
export SCALA_HOME=/usr/local/Cellar/scala/2.9.1-1

#Java
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

#JRebel
export JREBEL_HOME=/Applications/ZeroTurnaround/JRebel

#GAE
export GAE_PATH=/opt/appengine-java-sdk-1.3.4

#RUBYGEMS
export RUBYOPT=rubygems

#SBT_OPTS
export SBT_OPTS='-Xmx1500M -XX:MaxPermSize=512M'

#NODE.JS
export NODE_PATH=/usr/local/lib/node_modules

#LEJOS
export NXJ_HOME=/opt/lejos_nxj
export DYLD_LIBRARY_PATH=$NXJ_HOME/bin

#Aliases
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lah'
alias st='git st'
alias gitx='gitx --all'
alias g='git'
alias git=hub
complete -o default -o nospace -F _git g
alias ?='cat ~/bin/terminal_help'
alias c="ruby ~/bin/c.rb"
alias sed='gsed'
alias clj='rlwrap clj'
alias vi='vim'

#seting full path for symlinks
set -P

#PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH #BREW
export PATH=/Users/torbjorn/Development/workspace/SG/ff2/scripts:$PATH #hack&ship
export PATH=~/bin:$PATH #BIN & TUNNELS
export PATH=~/bin/sgStuff:$PATH #SG STUFF
export PATH=~/bin/gitExtras:$PATH #GIT EXTRAS
export PATH=~/bin/git-playback:$PATH #GIT PLAYBACK
export PATH=/usr/local/Cellar/jruby/1.5.2/jruby/bin:$PATH #JRUBY
export PATH=/Library/PostgreSQL/9.1/bin:$PATH #POSTGRESQL
export PATH=$JAVA_HOME/bin:$M3_HOME/bin:$PATH
export PATH=$NXJ_HOME/bin:$PATH

#Brew
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

#PROXY
function _proxy() {
  if $1; then
    echo "PROXY ON"
    export http_proxy=no-sfd6-websec1.z42.no.tconet.net:80
    export ALL_PROXY=$http_proxy
    echo $ALL_PROXY
  else
    echo "PROXY OFF"
    export http_proxy=
    export ALL_PROXY=
    echo $ALL_PROXY
  fi
}
alias proxyOn='_proxy true'
alias proxyOff='_proxy false'

#Time since last git commit
function commitTime(){
  if git ls-files >& /dev/null; then
    echo " $(git log --pretty=format:"%ar" | head -n 1 | sed 's/\([0-9]*\) \(.\).*/\1\2/')"
  fi
}

#Prompt
PS1='\[\033[0;31m\]\w\[\033[0;33m\] $(__git_ps1 " (%s)")\[\033[0;00m\]$(commitTime) ➜ '

#Growl the c status
growlnotify -m "`c ?`"

#Setting the tab title
function mycd() {
  if [ -n "$*" ]; then
    cd "$*"
  else
    cd $*
  fi
  set_xterm_titlebar `pwd | sed -Ee 's/\/Users\/torbjornvatn(.*)/\1/g' -e 's/^$/~/g'`
}
alias cd=mycd

whosonport () { lsof -i :$*; }

