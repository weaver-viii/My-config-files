# git-branches.bash 
  _git_branches() { 
    local cur 
    COMPREPLY=() 
    cur="${COMP_WORDS[COMP_CWORD]}" 
    CURRENT=`git branch | grep '^*' | awk '{print $2}'` 
    local versions=$(git branch | grep -v $CURRENT) 
    COMPREPLY=($(compgen -W "${versions}" $cur)) 
  } 
  complete -F _git_branches hack 
  complete -F _git_branches ship
