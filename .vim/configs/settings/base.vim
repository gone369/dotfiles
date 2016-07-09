" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set nomodeline "https://www.cs.swarthmore.edu/help/vim/modelines.html
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
set foldlevel=99
set guitablabel=\[%N\]\ %F\ %M 
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
  set transparency=10
endif

filetype plugin indent on
set autoindent		" always set autoindenting on
