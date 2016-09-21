"-------------airline-----------"
"set guifont=Source\ Code\ Pro\ for\ Powerline
set guifont=Roboto\ Mono\ Light\ for\ Powerline
let g:airline_powerline_fonts = 1
if !has("gui_running")
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = '|'
endif
"let g:airline_left_sep=' ⫸ '
"let g:airline_right_sep=' ⫷ '
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_section_c = expand('%:p')
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

 "airline symbols
"let g:airline_left_sep=' ⫸ '
"let g:airline_right_sep=' ⫷ '
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
  let g:airline#extensions#whitespace#enabled = 0

set laststatus=2
