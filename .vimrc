" File: .vimrc
" Author: gone369
" Description: vimrc
" Last Modified: March 11, 2015

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set splitbelow
set splitright
set background=dark
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set nowb
set noswapfile
set smarttab
set ai
set si
set ffs=unix,dos,mac
set encoding=utf8
set wildmenu
set wildmode=list:longest
set title
set scrolloff=3
set cmdheight=2
set number
set transparency=20

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


if has("gui_running")
    colors koehler
    set lines=56
    set columns=140
endif


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" THIS AUTO RELOADS VIM when VIMRC is changed
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" }

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"set mouse=a
"endif

" ---------------------HIGHLIGHTING----------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

"---- deletes highlighting after search by pressing esc
nnoremap <silent> <CR> :nohl <cr><cr>

" Only do this part when compiled with support for autocommands.
"
filetype plugin indent on
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else
    set autoindent		" always set autoindenting on
endif " has("autocmd")

"-------------------------------------VIMDIFF--------------------------------------------
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction
"ignore whitespace difference
set diffopt=iwhite

set nomodeline

if filereadable($HOME . "/.vimrc.info")
    source ~/.vimrc.info
else
    set viminfo=""
endif

"html indentation
let g:html_indent_inctags = "html,body,head,tbody,article,aside,details,figcaption,figure,footer,header,main,mark,nav,section,summary,time"


"----------------------------------------PLUGINS -------------------------
"pathogen
call pathogen#infect()
"ctrl p
set runtimepath^=~/.vim/bundle/ctrlp.vim
"nerd tree
let NERDTreeChDirMode=2
let NERDTreeMouseMode=3
let NERDTreeQuitOnOpen=1
"autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle <CR>
"easy motion plugin
map <Leader> <Plug>(easymotion-prefix)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
"numbers
nnoremap <Leader>n :NumbersToggle<CR> 
"syntastic
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"," proprietary attribute \"pattern"," proprietary attribute \"novalidate"]

"---------------------------------------------------------lightline plugin

set laststatus=2
if !has('gui-running')
    set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component':{
      \ 'readonly':'%{&readonly?"x":""}',
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

"
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"--------------end of lightline setup------------------"

"------------ control p mappings----------------
  let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<F1>'],
    \ 'ToggleRegex()':        ['<F3>'],
    \ 'ToggleByFname()':      ['<F2>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>', '<F4>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    \ }

" my personal mappings
"
"
" for visual mode
" pressing - or = in visual mode searches for the current selection
vnoremap <silent> = :call VisualSelection('f')<CR>
vnoremap <silent> - :call VisualSelection('b')<CR>

""""""""""""""""""""""""
" for moving around, tab,s windows and buffers
""""""""""""""""""""""""

" for searching
nnoremap <C-f> :S//<left>
inoremap <C-f> :S//<left>
onoremap <C-f> :S//<left>
"map <C-S-f> ?

" for replacing

nnoremap <C-r> :.,$S///gc<left><left><left><left>

" for windows
map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>
map <silent> <A-S-Up> :wincmd K<CR>
map <silent> <A-S-Down> :wincmd J<CR>
map <silent> <A-S-Left> :wincmd H<CR>
map <silent> <A-S-Right> :wincmd L<CR>
map <silent> <A-S-Down> :close <CR>

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


" for moving things after to next line
map <silent> <S-o> a<CR><esc>

" ctrl save
map <C-s> :w <CR>

" undo and redo

nmap <silent> <C-z> :u <CR>
nnoremap <silent> <C-y> :red <CR>
nmap <silent> <C-y> :red <CR>
map <silent> <C-y> :red <CR>

" select all
map <C-a> <esc>G$vgg

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

" visual block now mapped to Ctrl + B
nnoremap <C-b> <C-v>

" toggling folds
" F9 Told single fold
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
"F7 open all folds
inoremap <F7> zR
nnoremap <F7> zR
onoremap <F7> zR
vnoremap <F7> zR
"F8 close all folds
inoremap <F8> zM
nnoremap <F8> zM
onoremap <F8> zM
vnoremap <F8> zM
" fold methods
augroup vimrc
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" spell check
nmap <leader>spell :setlocal spell!<cr>
autocmd FileType gitcommit setlocal spell
autocmd FileType svn setlocal spell
autocmd FileType asciidoc setlocal spell

"trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

"vimgrep"
nnoremap <Leader>grep :lvimgrep /a/gj %<CR><bar>:lopen<CR><bar>:lvimgrep //gj **/**<left><left><left><left><left><left><left><left><left>
"look at all snippets"
nmap <Leader>snip i<C-R><tab>
nmap <F5> :call ReloadAllSnippets()

