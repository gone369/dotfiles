sudo apt-get update
sudo apt-get install git
sudo apt-get install nginx
sudo apt-get install htop
sudo apt-get install tmux

git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
. ~/.nvm/nvm.sh

