function base {
  sudo -s
  if [ ! -d '/usr/local/lib' ]; then
    sudo mkdir -p "/usr/local/lib"
  fi
  if [ ! -d '/usr/local/bin' ]; then
    sudo mkdir -p "/usr/local/bin"
  fi
  'made directories'
}

function rungit {
  # Some git defaults
  git config --global color.ui true
  git config --global push.default simple
  cd ~
  git clone https://github.com/altercation/solarized.git terminaltheme
  git submodule update --init --recursive
}

function finish {
  cd ~
  if [ ! -d 'terminalrootconfig' ]; then
    git clone https://github.com/gone369/terminalrootconfig.git
  fi
  cp -r terminalrootconfig/. ~
  rm -rf terminalrootconfig
  rungit
}

#modules
function runnvm {
  # Install nvm
  if test ! $(which nvm); then
    echo "Installing nvm..."
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
  fi
  echo 'installing npm'
  if [ -f ~/.bashrc ]; then
    source ~/.bashrc
  else
    touch ~/.bashrc
    source ~/.bashrc
    source ~/.bash_profile
  fi
  nvm install node
  nvm alias default node
}

function runnpm {
  echo 'installing npm modules'
  modules=(
    grunt-cli
    gulp
    webpack
    bower
    express
    babel-eslint
    eslint
    eslint-plugin-react
    jshint
    npm-check-updates
    react-tools
    syntastic-react
  )
  npm install -g ${modules[@]}
}

function runbrew {
  #test if homebrew is installed
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update
  brew install bash
  chsh -s /usr/local/bin/bash
  echo 'installing git...'
  brew install git
  echo 'installing macvim...'
  brew install macvim 
  brew install iterm2
  brew install htop
  brew install tidy-html5

  brew tap universal-ctags/universal-ctags
  brew install --HEAD universal-ctags

  #brew cask
  echo 'installing brew cask...'

  apps=(
    google-chrome
    firefox
    puush
    skype
    insomniax
    postman
  )

  echo 'instalilng apps...'
  brew cask install ${apps[@]}
}



#operating systems
function mac {
  echo 'install mac'
  x-code-select --install
  runbrew
  runnvm
  runnpm
}

function linux {
  echo 'install linux'
  sudo apt-get update
  runnvm
  runnpm
}

#main 

base
OSNAME=$(uname -s)
case $OSNAME in
  'Darwin')
    mac
    ;;
  *)
    linux
    ;;
esac
finish

exit
