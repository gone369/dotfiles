"------------------------------------Tabularize-----------------------------"
if exists(":Tabularize")
  nmap e= :Tabularize /= <cr>
  vmap e= :Tabularize /= <CR>
  nmap e: :Tabularize /:<CR>
  vmap e: :Tabularize /:<CR>
  "nmap <Leader>t: :Tabularize /:\zs<CR>
  "vmap <Leader>t: :Tabularize /:\zs<CR>
endif
