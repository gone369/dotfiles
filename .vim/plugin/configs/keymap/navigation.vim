" for visual mode
" pressing - or = in visual mode searches for the current selection
vnoremap <silent> = :call VisualSelection('f')<CR>
vnoremap <silent> - :call VisualSelection('b')<CR>

""""""""""""""""""""""""
" for windows (does not work in iOS or macvim)
map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>
map <silent> <A-S-Up> :wincmd K<CR>
map <silent> <A-S-Down> :wincmd J<CR>
map <silent> <A-S-Left> :wincmd H<CR>
map <silent> <A-S-Right> :wincmd L<CR>

" for splits
nnoremap sj :bel sp new<cr>
nnoremap sk :abo sp new<cr>
nnoremap sh :lefta vsp new<cr>
nnoremap sl :rightb vsp new<cr>
" for tabs
"
map <silent> <C-Left> :tabp<CR>
map <silent> <C-Right> :tabn<CR>
map <C-Up> :tabnew <CR>

map <silent> <C-S-Left> :tabm -1 <CR>
map <silent> <C-S-Right> :tabm +1 <CR>

" save tab
map <C-Down> :wq<CR>
"quit tab
map <C-S-Down> :q!<CR>
