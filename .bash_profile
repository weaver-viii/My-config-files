# Init rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#Maven
export MAVEN_OPTS="-Xmx1024M -XX:MaxPermSize=256M  -Dlogback.configurationFile=file:/Users/torbjorn/Development/workspace/SG/ff2/front/src/main/resources/logback-torbjorn.xml"
export REPO="$HOME/.m2/repository"

#Akka
export AKKA_HOME=/Applications/typesafe-stack

#Scala
export SCALA_HOME=/usr/local/Cellar/scala/2.9.1-1

#Java
export JAVA_HOME=$(/usr/libexec/java_home)

#JRebel
export JREBEL_HOME=/Applications/JRebel

#GAE
export GAE_PATH=/opt/appengine-java-sdk-1.3.4

#RUBYGEMS
export RUBYOPT=rubygems

#SBT_OPTS
export SBT_OPTS='-Xmx1500M -XX:MaxPermSize=512M'

#EDITOR
export EDITOR=/usr/local/bin/vim

#rbenv
export RBENV_ROOT=/usr/local/var/rbenv

#Aliases
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lah'
alias st='git st'
alias gitx='gitx --all'
alias g='git'
alias git=hub
alias gpg=gpg2
complete -o default -o nospace -F _git g
alias ?='cat ~/bin/terminal_help'
if [ -f '~/bin/c.rb' ]; then
  alias c="ruby ~/bin/c.rb"
  #Growl the c status
  growlnotify -m "`c ?`"
fi
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
function proxy() {
  if [ -z "$ALL_PROXY" ]; then
    echo "PROXY ON"
    export http_proxy=http://no-sfd6-websec1.z42.no.tconet.net:80
    export HTTP_PROXY=http://no-sfd6-websec1.z42.no.tconet.net:80
    export https_proxy=http://no-sfd6-websec1.z42.no.tconet.net:80
    export HTTPS_PROXY=http://no-sfd6-websec1.z42.no.tconet.net:80
    export ALL_PROXY=$http_proxy
    echo $ALL_PROXY
  else
    echo "PROXY OFF"
    export http_proxy=
    export https_proxy=
    export ALL_PROXY=
  fi
}

#Time since last git commit
function commitTime(){
  if git ls-files >& /dev/null; then
    echo " $(git log --pretty=format:"%ar" | head -n 1 | sed 's/\([0-9]*\) \(.\).*/\1\2/')"
  fi
}

#Checks wheter the proxy is enabled or not
function proxyEnabled() {
  if [ -n "$ALL_PROXY" ]; then
    echo "⟲ "
  fi
}

#Prompt
PS1='\[\033[0;31m\]\w\[\033[0;33m\] $(__git_ps1 " (%s)")\[\033[0;00m\]$(commitTime)\n$(proxyEnabled)❤ '

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

# Mark and Jump stuff
export MARKPATH=$HOME/.marks
function jump { 
    cd "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l | sed -re 's/.*\/(.*)$/\1/g')
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}
complete -F _completemarks jump unmark
