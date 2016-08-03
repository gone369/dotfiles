" ---------------------HIGHLIGHTING----------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" ---------------------(syntax)SYNTAX HIGHLIGHTING----------------------------
autocmd BufNewFile,BufRead *.coffee setl shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile .eslintrc,.babelrc setfiletype json
"au FileType javascript call JavaScriptFold()
"autocmd BufReadPre *.js let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,react,flux,jasmin'
"autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
"autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
"autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
"
let g:javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1
"turn .js files into .jsx files if 0
let g:jsx_ext_required = 0 

"---- deletes highlighting after search by pressing esc
nnoremap <silent> <CR> :nohl <cr><cr>

