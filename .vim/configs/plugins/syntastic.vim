"-------------------------------syntastic--------------------------------
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
" Set up the arrays to ignore for later
if !exists('g:syntastic_html_tidy_ignore_errors')
  let g:syntastic_html_tidy_ignore_errors = []
endif

if !exists('g:syntastic_html_tidy_blocklevel_tags')
  let g:syntastic_html_tidy_blocklevel_tags = []
endif

" Try to use HTML5 Tidy for better checking?
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy'
" AP: honestly can't remember if this helps or not
" installed with homebrew locally

" Angular's attributes confuse HTML Tidy
let g:syntastic_html_tidy_ignore_errors += [" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

" Angular ignores
let g:syntastic_html_tidy_blocklevel_tags += [
      \ 'ng-include',
      \ 'ng-form'
      \ ]

