My Dotfiles
===========

```bash
cd ~
git init
git remote add origin https://github.com/gone369/dotfiles.git
git pull origin master
```

## using [vim-plugged](https://github.com/junegunn/vim-plug) to maintain your vim plugins (RECOMMENDED)
open up .vimrc
```bash
vim ~/.vimrc`
```
* edit the Plug files specified in .vimrc  
<u><b>(note some plugins require python supported vim, [node.js](nodejs.org) installed and [powerline fonts](https://github.com/powerline/fonts))</b></u>
* Execute `:PlugInstall`

## using [pathogen](https://github.com/tpope/vim-pathogen) to maintain your vim plugins

you can manually manage your bundles in .vim/bundle
or i've written a bash helper script to help organize your plugins with git submodules

### adding Plugins
```bash
cd ~/.vim/scripts
sh vim.sh add https://github.com/mhinz/vim-startify
```
you can replace `https://github.com/mhinz/vim-startify` with any github url

### updating Plugins to master branch
```bash
cd ~/.vim/scripts
sh vim.sh update
```
### removing Plugins
```bash
cd ~/.vim/scripts
sh vim.sh remove vim-startify
```
you can replace `vim-startify` with any folder name in .vim/bundle


#### You can ignore the other misc. stuffs in the dotfiles folders otherwise feel free to look around
