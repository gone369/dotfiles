#!/bin/bash
usage() { echo "Usage: $0 [add|remove|update] [<giturl>|<bundle folder path>|]" 1>&2; exit 1; }

function checkUrl(){
  urlregex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
  if [[ $1 =~ $urlregex ]]
  then 
    return 1
  else
    return 0
  fi
}


#main
function add {
  if checkUrl $1 ; then
    echo "not a valid url"
    usage
    exit 1
  fi
  echo "add $1"
  pushd ~/.vim/bundle
  git submodule add $1
  popd
  exit 0
}
function remove {
  if [ ! -d "$1" ]; then
    echo "directory does not exist"
    usage
    exit 1
  fi
  echo "remove $1"
  pushd ~
  sh ~/.vim/scripts/removeBundleModule.sh $1
  popd
  exit 0
}
function update {
  pushd ~
  git submodule update --init --recursive
  git submodule foreach --recursive git fetch
  git submodule foreach --recursive git merge origin master
  popd
  exit 0
}
function checkEmpty(){
  if [ -z $1 ]
  then
    usage
    exit 1
  fi
}


p="$(pwd)/$2"

case ${1} in
  add)
    checkEmpty $2
    add $2
    ;;
  remove)
    checkEmpty $2
    remove $p
    ;;
  update)
    update
    ;;
  *)
    usage
    exit 
    ;;
esac

