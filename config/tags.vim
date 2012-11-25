let $VIMTAGS = expand("$VIMROOT") . '/runtime/tags'

" easytags setup
if has("win32")
    let g:easytags_cmd = resolve(fnamemodify(expand("$VIMROOT"), ":8") . '\win\ctags58\ctags.exe')
endif

set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_file = expand("$VIMTAGS") . '/global-tags'
let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
let g:easytags_auto_highlight = 0
let g:easytags_updatetime_min = 3000
set updatetime=3000


" keybinding to force tag update (just in case you dont want to wait some seconds)
nnoremap <silent> <F12> :UpdateTags!<CR>


" Haskell stuff
if executable('lushtags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
endif
