" ---------------------HIGHLIGHTING----------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" ---------------------(syntax)SYNTAX HIGHLIGHTING----------------------------
autocmd BufNewFile,BufReadPre *.coffee setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd BufNewFile,BufReadPre *.ejs set filetype=html
autocmd BufNewFile,BufReadPre *.es6 setfiletype javascript
autocmd BufNewFile,BufReadPre .eslintrc,.babelrc setfiletype json

autocmd BufNewFile,BufReadPre *.js let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,react,flux,jasmin,chai'
autocmd BufNewFile,BufReadPre *.js let b:javascript_lib_use_jquery = 0
autocmd BufNewFile,BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufNewFile,BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufNewFile,BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufNewFile,BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd BufNewFile,BufReadPre *.js let b:javascript_lib_use_angularuirouter = 1
autocmd BufNewFile,BufReadPre *.js let b:javascript_lib_use_react = 1

"au FileType javascript call JavaScriptFold()
"
let g:javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1
"turn .js files into .jsx files if 0
let g:jsx_ext_required = 0 

"---- deletes highlighting after search by pressing esc
nnoremap <silent> <CR> :nohl <cr><cr>

