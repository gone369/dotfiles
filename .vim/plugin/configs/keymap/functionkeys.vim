" fold methods
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" toggling folds
" F12 Toggle single fold
inoremap <F12> <C-O>za :echo "toggle single fold" <cr>
nnoremap <F12> za      :echo "toggle single fold" <cr>
onoremap <F12> <C-C>za :echo "toggle single fold" <cr>
vnoremap <F12> zf      :echo "toggle single fold" <cr>
"F11 close all folds
inoremap <F11> zM      :echo "close all fold" <cr>
nnoremap <F11> zM      :echo "close all fold" <cr>
onoremap <F11> zM      :echo "close all fold" <cr>
vnoremap <F11> zM      :echo "close all fold" <cr>
"F10 open all folds
inoremap <F10> zR      :echo "open all fold" <cr>
nnoremap <F10> zR      :echo "open all fold" <cr>
onoremap <F10> zR      :echo "open all fold" <cr>
vnoremap <F10> zR      :echo "open all fold" <cr>
" spell check
inoremap <F3> :setlocal spell!<cr> :echo "spell check Toggle"<cr> 
nnoremap <F3> :setlocal spell!<cr> :echo "spell check Toggle"<cr>
onoremap <F3> :setlocal spell!<cr> :echo "spell check Toggle"<cr>
vnoremap <F3> :setlocal spell!<cr> :echo "spell check Toggle"<cr>
autocmd FileType gitcommit setlocal spell
autocmd FileType svn setlocal spell
autocmd FileType asciidoc setlocal spell

" Syntastic Toggle
inoremap <F2> :SyntasticToggleMode <cr> :echo "Toggling Syntastic" 
nnoremap <F2> :SyntasticToggleMode <cr> :echo "Toggling Syntastic"
onoremap <F2> :SyntasticToggleMode <cr> :echo "Toggling Syntastic"
vnoremap <F2> :SyntasticToggleMode <cr> :echo "Toggling Syntastic"

"look at all snippets"
nmap <Leader>snip i<C-R><tab>
nmap <F4> :call ReloadAllSnippets()<CR>

" Color Tuner Toggle
inoremap <F1> :Colortuner <cr>  
nnoremap <F1> :Colortuner <cr> 
onoremap <F1> :Colortuner <cr> 
vnoremap <F1> :Colortuner <cr> 
