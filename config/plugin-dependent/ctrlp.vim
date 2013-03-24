" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'E'

let g:ctrlp_cache_dir = expand("$VIM_RUNTIME") . '/ctrlp/cache'

if has("win32")
    let g:ctrlp_mruf_case_sensitive = 0
else
    let g:ctrlp_mruf_case_sensitive = 1
endif

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](.git|.hg|.svn|.bzr|bin|cabal-dev|dist)$',
    \ 'file': '\v\.(exe|so|dll|o|swp|pyc|wav|mp3|ogg|pdf|hi)$',
    \ }

