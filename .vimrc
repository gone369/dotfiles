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
set shiftwidth=2
set tabstop=2
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
colors solarized
"colors koehler

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
  if !has("win32")
    set transparency=10
  endif
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

" ---------------------(syntax)SYNTAX HIGHLIGHTING----------------------------
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
au FileType javascript call JavaScriptFold()
autocmd BufReadPre *.js let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,react,flux,jasmin'
"autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
"autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
"
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0

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
"---------------------------------------------pathogen
call pathogen#infect()
"---------------------------------------------colortuner
let g:colortuner_filepath='~/.vim/.vim-colortuner'
let g:colortuner_enabled=1
let g:colortuner_vivid_mode=0
let g:colortuner_preferred_schemes=[]
"---------------------------------------------nerdtree
let NERDTreeChDirMode=2
let NERDTreeMouseMode=3
let NERDTreeQuitOnOpen=1
"autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle <CR>
"--------------------------------------------easymotion plugin
map <Leader> <Plug>(easymotion-prefix)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
"-----------------------------------------------------numbers
nnoremap <Leader>n :NumbersToggle<CR>
"------------------------------------------------------syntastic
let g:syntastic_always_populate_loc_list = 1

nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 1
" Set up the arrays to ignore for later
if !exists('g:syntastic_html_tidy_ignore_errors')
    let g:syntastic_html_tidy_ignore_errors = []
endif

if !exists('g:syntastic_html_tidy_blocklevel_tags')
    let g:syntastic_html_tidy_blocklevel_tags = []
endif

" Try to use HTML5 Tidy for better checking?
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy5'
" AP: honestly can't remember if this helps or not
" installed with homebrew locally

" Ignore ionic tags in HTML syntax checking
" See http://stackoverflow.com/questions/30366621
" ignore errors about Ionic tags
let g:syntastic_html_tidy_ignore_errors += [
      \ "<ion-",
      \ "discarding unexpected </ion-"]

" Angular's attributes confuse HTML Tidy
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ng-"]

" Angular UI-Router attributes confuse HTML Tidy
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ui-sref"]

" Angular in particular often makes 'empty' blocks, so ignore
" this error. We might improve how we do this though.
" See also https://github.com/scrooloose/syntastic/wiki/HTML:---tidy
" specifically g:syntastic_html_tidy_empty_tags
let g:syntastic_html_tidy_ignore_errors += ["trimming empty "]

" Angular ignores
let g:syntastic_html_tidy_blocklevel_tags += [
      \ 'ng-include',
      \ 'ng-form'
      \ ]

" Angular UI-router ignores
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ui-sref"]

"-------------airline-----------"
if !has("gui_running")
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = '|'
endif
let g:airline_left_sep=' ⫸ '
let g:airline_right_sep=' ⫷ '
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_section_c = expand('%:p')

set laststatus=2
"---------------------------------------------------------lightline plugin

"set laststatus=2
"if !has('gui-running')
    "set t_Co=256
"endif
"let g:lightline = {
      "\ 'colorscheme': 'solarized',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      "\   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      "\ },
      "\ 'component':{
      "\ 'readonly':'%{&readonly?"x":""}',
      "\ },
      "\ 'component_function': {
      "\   'fugitive': 'MyFugitive',
      "\   'filename': 'MyFilename',
      "\   'fileformat': 'MyFileformat',
      "\   'filetype': 'MyFiletype',
      "\   'fileencoding': 'MyFileencoding',
      "\   'mode': 'MyMode',
      "\   'ctrlpmark': 'CtrlPMark',
      "\ },
      "\ 'component_expand': {
      "\   'syntastic': 'SyntasticStatuslineFlag',
      "\ },
      "\ 'component_type': {
      "\   'syntastic': 'error',
      "\ },
      "\ }

"function! MyModified()
  "return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"endfunction

"function! MyReadonly()
  "return &ft !~? 'help' && &readonly ? 'RO' : ''
"endfunction

"function! MyFilename()
  "let fname = expand('%:t')
  "return fname == 'ControlP' ? g:lightline.ctrlp_item :
        "\ fname == '__Tagbar__' ? g:lightline.fname :
        "\ fname =~ '__Gundo\|NERD_tree' ? '' :
        "\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        "\ &ft == 'unite' ? unite#get_status_string() :
        "\ &ft == 'vimshell' ? vimshell#get_status_string() :
        "\ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        "\ ('' != fname ? fname : '[No Name]') .
        "\ ('' != MyModified() ? ' ' . MyModified() : '')
"endfunction

"function! MyFugitive()
  "try
    "if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      "let mark = ''  " edit here for cool mark
      "let _ = fugitive#head()
      "return strlen(_) ? mark._ : ''
    "endif
  "catch
  "endtry
  "return ''
"endfunction

"function! MyFileformat()
  "return winwidth(0) > 70 ? &fileformat : ''
"endfunction

"function! MyFiletype()
  "return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
"endfunction

"function! MyFileencoding()
  "return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
"endfunction

"function! MyMode()
  "let fname = expand('%:t')
  "return fname == '__Tagbar__' ? 'Tagbar' :
        "\ fname == 'ControlP' ? 'CtrlP' :
        "\ fname == '__Gundo__' ? 'Gundo' :
        "\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        "\ fname =~ 'NERD_tree' ? 'NERDTree' :
        "\ &ft == 'unite' ? 'Unite' :
        "\ &ft == 'vimfiler' ? 'VimFiler' :
        "\ &ft == 'vimshell' ? 'VimShell' :
        "\ winwidth(0) > 60 ? lightline#mode() : ''
"endfunction

"function! CtrlPMark()
  "if expand('%:t') =~ 'ControlP'
    "call lightline#link('iR'[g:lightline.ctrlp_regex])
    "return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          "\ , g:lightline.ctrlp_next], 0)
  "else
    "return ''
  "endif
"endfunction

"let g:ctrlp_status_func = {
  "\ 'main': 'CtrlPStatusFunc_1',
  "\ 'prog': 'CtrlPStatusFunc_2',
  "\ }

"function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  "let g:lightline.ctrlp_regex = a:regex
  "let g:lightline.ctrlp_prev = a:prev
  "let g:lightline.ctrlp_item = a:item
  "let g:lightline.ctrlp_next = a:next
  "return lightline#statusline(0)
"endfunction

"function! CtrlPStatusFunc_2(str)
  "return lightline#statusline(0)
"endfunction

"let g:tagbar_status_func = 'TagbarStatusFunc'

"function! TagbarStatusFunc(current, sort, fname, ...) abort
    "let g:lightline.fname = a:fname
  "return lightline#statusline(0)
"endfunction

""
"augroup AutoSyntastic
  "autocmd!
  "autocmd BufWritePost *.c,*.cpp call s:syntastic()
"augroup END
"function! s:syntastic()
  "SyntasticCheck
  "call lightline#update()
"endfunction

"let g:unite_force_overwrite_statusline = 0
"let g:vimfiler_force_overwrite_statusline = 0
"let g:vimshell_force_overwrite_statusline = 0

"--------------end of lightline setup------------------"
"------------------------------------Tabularize-----------------------------"
if exists(":Tabularize")
  nmap e= :Tabularize /= <cr>
  vmap e= :Tabularize /= <CR>
  nmap e: :Tabularize /:<CR>
  vmap e: :Tabularize /:<CR>
  "nmap <Leader>t: :Tabularize /:\zs<CR>
  "vmap <Leader>t: :Tabularize /:\zs<CR>
endif
"------------------------------------MatchTagAlways------------------------------------"
nnoremap <leader>% :MtaJumpToOtherTag<cr>
"------------------------------------IndentLine------------------------------------"
"" Vim
let g:indentLine_color_term = 239
"GVim
let g:indentLine_color_gui = '#12678f'
" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
"--------------------------------------ctrlp-------------------------------------------"
set runtimepath^=~/.vim/bundle/ctrlp.vim
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


" for moving things after to next line
map <silent> <S-o> a<CR><esc>

" mksession
map <C-s> :mksession! work.vim <CR>
map <C-l> :source work.vim <CR>

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

" fold methods
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" toggling folds
" F12 Told single fold
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
inoremap <F9> :setlocal spell!<cr> :echo "spell check Toggle"<cr> 
nnoremap <F9> :setlocal spell!<cr> :echo "spell check Toggle"<cr>
onoremap <F9> :setlocal spell!<cr> :echo "spell check Toggle"<cr>
vnoremap <F9> :setlocal spell!<cr> :echo "spell check Toggle"<cr>
autocmd FileType gitcommit setlocal spell
autocmd FileType svn setlocal spell
autocmd FileType asciidoc setlocal spell
" Syntastic Toggle
inoremap <F8> :SyntasticToggleMode <cr> :echo "Toggling Syntastic" 
nnoremap <F8> :SyntasticToggleMode <cr> :echo "Toggling Syntastic"
onoremap <F8> :SyntasticToggleMode <cr> :echo "Toggling Syntastic"
vnoremap <F8> :SyntasticToggleMode <cr> :echo "Toggling Syntastic"
" Color Tuner Toggle
inoremap <F1> :Colortuner <cr>  
nnoremap <F1> :Colortuner <cr> 
onoremap <F1> :Colortuner <cr> 
vnoremap <F1> :Colortuner <cr> 

"trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

"vimgrep"
autocmd BufEnter * silent! lcd %:p:h
nnoremap <Leader>grep :lvimgrep /a/gj %<CR><bar>:lopen<CR><bar>:lvimgrep //gj **/**<left><left><left><left><left><left><left><left><left>
set switchbuf+=usetab,newtab "used for quickfix windows, open things in new tab
"look at all snippets"
nmap <Leader>snip i<C-R><tab>
nmap <F5> :call ReloadAllSnippets()<CR>

"CoffeeScript"
nmap <silent>ccv :CoffeeCompile \| vertical cwindow<CR>
nmap <silent>cch :CoffeeCompile \| horizontal cwindow<CR>
nmap <silent>ccV :'<,'>CoffeeComiple \| vertical cwindow<CR>

nmap <silent>clv :CoffeeLint \| vertical cwindow<CR><C-w>=
nmap <silent>clh :CoffeeLint \| horizontal cwindow<CR><C-w>=
nmap <silent>clV :'<,'>CoffeeLint \| vertical cwindow<CR><C-w>=

vnoremap <silent>cr :CoffeeRun<CR>



