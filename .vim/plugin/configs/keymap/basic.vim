" Don't use Ex mode, use Q for formatting
map Q gq

" undo and redo
" asdfsa
nmap <silent> <C-z> :u <CR>
nnoremap R :red <CR>

" copy pasting to clipboard
function! Paste(mode)
  if a:mode == "v"
    normal gv
    normal "+P
    normal l
  elseif a:mode == "i"
    set virtualedit=all
    normal `^"+gP
    let &virtualedit = ""
  endif
endfunction
vnoremap <C-x> "+d
vnoremap <C-c> "+y
nnoremap <C-v> "+gPl
vnoremap <C-v> :<C-U>call Paste("v")<CR>
inoremap <C-v> <C-O>:call Paste("i")<CR>

"visual block now mapped to Ctrl-v
nnoremap <C-b> <C-v> 
