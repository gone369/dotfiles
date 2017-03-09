let g:codi#interpreters = {
  \ 'javascript': {
    \ 'rightalign': 0,
  \ },
\ }

let g:codi#aliases = {
  \ '*.jsx': 'javascript',
\ }

let g:codi#width = 40  "the width of the Codi Split
let g:codi#rightsplit = 1 "Whether or not to spawn Codi on the right side of the current buffer. If 0, Codi spawns on the left.  Default value is 1.
let g:codi#rightalign = 1 "Whether or not to right-align the Codi Buffer. If 0, the Codi buffer is left-aligned. Default is 1
let g:codi#autoclose = 1 "Whether or not to close Codi when the associated buffer is closed. Default is 1
let g:codi#raw = 0 "Whether or not to display interpreter results without formatting each expression to align with the line numbers. Useful if you are debugging a |codi-interpreters-preprocess|. Default is 0
let g:codi#sync = 0 "Whether or not force synchronous execution. No reason to touch this unless you want to compare async to sync. Default is 0
let g:codi#use_buffer_dir = 1 "Start the REPL with the working directory of the buffer being edited instead of Vim's current working directory. This can make it easier for your code to use paths relative to the script path.

let g:codi#log = ''  "Path to the file where Codi logs information. This can be useful for debugging (e.g. |codi-interpreters-preprocess|) and when fixing or submitting issues. Default value is '', which disables all logging.
