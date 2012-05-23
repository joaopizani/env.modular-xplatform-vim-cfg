let $VIMTAGS = expand("$VIMROOT") . '/runtime/tags'


" easytags setup
if has("win32")
    let g:easytags_cmd = resolve(fnamemodify(expand("$VIMROOT"), ":8") . '\win\ctags58\ctags.exe')
endif
let g:easytags_by_filetype = expand("$VIMTAGS") . '/easytagsdb'
let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
let g:easytags_auto_highlight = 1
let g:easytags_updatetime_min = 2000
set updatetime=2000

" keybinding to force tag update (just in case you dont want to wait some seconds)
nnoremap <silent> <Leader>t :UpdateTags<CR>
nnoremap <silent> <Leader>tc :UpdateTags!<CR>

" easytagsdb
set tags=$VIMTAGS/easytagsdb/*

" tags for libraries
set tags+=$VIMTAGS/std
set tags+=$VIMTAGS/qt4
set tags+=$VIMTAGS/qtgstreamer
set tags+=$VIMTAGS/quazip



" OmniCppCompletion
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 0
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


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
