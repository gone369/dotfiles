"Most used options:~
let g:startify_bookmarks = [ { 'v': '~/.vimrc' }, { 'b': '~/.bash_profile' } ]
let g:startify_change_to_dir = 1
"g:startify_change_to_vcs_root
"g:startify_custom_header
"g:startify_enable_special
let g:startify_list_order = [
  \ ['   MRU:'],
  \ 'files',
  \ ['   MRU within this dir:'],
  \ 'dir',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ]
let g:startify_relative_path = 1
"g:startify_skiplist
let g:startify_update_oldfiles = 1

"Misc options:~
"g:startify_custom_footer
"g:startify_custom_header_quotes
"g:startify_custom_indices
"g:startify_disable_at_vimenter
"g:startify_enable_unsafe
let g:startify_files_number = 10 
"g:startify_mapping_nowait
"g:startify_skiplist_server
"g:startify_use_env

"Sessions:~
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_persistence = 1 
"g:startify_session_remove_lines
"g:startify_session_savecmds
"g:startify_session_savevars
"
map <C-s> :SSave <CR>
map <C-l> :SLoad <CR>
