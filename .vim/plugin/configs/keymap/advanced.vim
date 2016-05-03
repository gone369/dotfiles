"trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

"vimgrep"
autocmd BufEnter * silent! lcd %:p:h
nnoremap <Leader>grep :lvimgrep /a/gj %<CR><bar>:lopen<CR><bar>:lvimgrep //gj **/**<left><left><left><left><left><left><left><left><left>
set switchbuf+=usetab,newtab "used for quickfix windows, open things in new tab

"date"
nnoremap <Leader>date "=strftime("%c")<CR>P
inoremap <Leader>date <C-R>=strftime("%c")<CR>

"CoffeeScript"
"nmap <silent>ccv :CoffeeCompile \| vertical cwindow<CR>
"nmap <silent>cch :CoffeeCompile \| horizontal cwindow<CR>
"nmap <silent>ccV :'<,'>CoffeeComiple \| vertical cwindow<CR>
"nmap <silent>clv :CoffeeLint \| vertical cwindow<CR><C-w>=
"nmap <silent>clh :CoffeeLint \| horizontal cwindow<CR><C-w>=
"nmap <silent>clV :'<,'>CoffeeLint \| vertical cwindow<CR><C-w>=
"vnoremap <silent>cr :CoffeeRun<CR>
