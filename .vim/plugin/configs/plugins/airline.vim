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
