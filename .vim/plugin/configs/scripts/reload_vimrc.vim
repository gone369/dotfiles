" THIS AUTO RELOADS VIM when VIMRC is changed
augroup reload_vimrc 
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
