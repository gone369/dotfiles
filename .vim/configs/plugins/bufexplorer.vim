let g:bufExplorerDisableDefaultKeyMapping=1    " Disable mapping.
let g:bufExplorerShowNoName=1        " Show "No Name" buffers.
let g:bufExplorerShowRelativePath=0  " Show absolute paths.
let g:bufExplorerShowTabBuffer=0        " No.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
"let g:bufExplorerSortBy='extension'  " Sort by file extension.
"let g:bufExplorerSortBy='fullpath'   " Sort by full file path name.
"let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
"let g:bufExplorerSortBy='number'     " Sort by the buffer's number.
nmap <silent><Leader>` :BufExplorer<CR>
