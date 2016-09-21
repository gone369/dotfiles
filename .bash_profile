if [ -f -/bashrc ]; then
    source ~/.bashrc
fi
if [ -f -/profile ]; then
    source ~/.profile
fi

#history
export HISTSIZE=2000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
shopt -s histappend
#PROMPT_COMMAND='history -a'
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE="..:...:cd:ls:ps:history"
#shopt -s cmdhist

#remove suspend terminal function and allow us to go back in recursive search after pressing ctrl+r
stty -ixon



#shows complete path in terminal
export PS1='\u@\H:\w$ '
#show different color for folders and files
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

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

function cs()
{
  if [ $# -eq 0 ]; then
      cd && ls
  else
      cd "$*" && ls
  fi
}
function grepe(){
  grep --color -Er $1 $2
}

alias cd='cs'
alias aliases='vim ~/.bash_profile'
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -FGlAhp'
alias la='ls -a'
alias open='open -a Finder ./'
alias mongostart="launchctl start org.mongodb.mongod"
alias mongostop="launchctl stop org.mongodb.mongod"
alias apachestart="sudo apachectl start"
alias apachestop="sudo apachectl stop"
alias apacherestart="sudo apachectl restart"
alias mvimt="open -a MacVim"
alias mv="mv -v"
alias cp="cp -v"
alias grep="grepe"
alias tmuxhelp="cat ~/.tmuxhelp.txt"
alias v="sh ~/.vim/scripts/vim.sh"

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
alias tmux="TERM=screen-256color-bce tmux"

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
