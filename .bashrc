
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### Added by the Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"

## nvm
export NVM_DIR="/Users/Xun/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#history
export HISTSIZE=2000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE="..:...:cd:ls:ps:history"

#remove suspend terminal function and allow us to go back in recursive search after pressing ctrl+r
stty -ixon

#shows complete path in terminal
export PS1='\u@\H:\w$ '
#show different color for folders and files
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin


export PATH="/opt/local/bin:/opt/local/sbin:$PATH"


# aliases
[ -f ~/.aliases ] && source ~/.aliases

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}

# helper fnc
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function cs() {
  if [ $# -eq 0 ]; then
      cd && ls
  else
      cd "$*" && ls
  fi
}
alias cd='cs'

function grepe(){
  grep --color -Er $1 $2
}

alias grep="grepe"

resetroute () {
    echo "Flushing routes...";
    for i in $(ifconfig | egrep -o "^[a-z].+\d{1}:" | sed 's/://');
    do
        sudo ifconfig "$i" down;
    done;
    sudo route -n flush;
    for i in $(ifconfig | egrep -o "^[a-z].+\d{1}:" | sed 's/://');
    do
        sudo ifconfig "$i" up;
    done
}

alias resetRouter="resetroute"
