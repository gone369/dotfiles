" File: .vimrc
" Author: gone369
" Description: vimrc
" Last Modified: Mon May  2 20:48:03 2016
"
"~/.vim/plugin/configs/settings/settings.vim
"~/.vim/plugin/configs/settings/syntax/highlighting.vim
"~/.vim/plugin/configs/settings/syntax/indent.vim
"
"~/.vim/plugin/configs/plugins/*.vim
"
"~/.vim/plugin/configs/keymap/advanced.vim
"~/.vim/plugin/configs/keymap/basic.vim
"~/.vim/plugin/configs/keymap/functionkeys.vim
"~/.vim/plugin/configs/keymap/navigation.vim
"~/.vim/plugin/configs/keymap/search.vim
"~/.vim/plugin/configs/keymap/session.vim
execute pathogen#infect()

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif
