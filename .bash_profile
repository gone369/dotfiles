if [ -f -/bashrc ]; then
    source ~/.bashrc
fi
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
alias cd='cs'

alias aliases='vim ~/.bash_profile'
alias ..='cd ../'
alias ...='cd ../..'
alias ll='ls -FGlAhp'
alias la='ls -a'
alias open='open -a Finder ./'
alias mongostart="launchctl start org.mongodb.mongod"
alias mongostop="launchctl stop org.mongodb.mongod"




##
# Your previous /Users/Xun/.bash_profile file was backed up as /Users/Xun/.bash_profile.macports-saved_2015-05-10_at_21:35:45
##

# MacPorts Installer addition on 2015-05-10_at_21:35:45: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/xun/.bash_profile file was backed up as /Users/xun/.bash_profile.macports-saved_2015-07-21_at_16:17:10
##

# MacPorts Installer addition on 2015-07-21_at_16:17:10: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
