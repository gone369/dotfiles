git rm -r $1 --cached
git submodule add https://github.com/$2/$1.git $1
