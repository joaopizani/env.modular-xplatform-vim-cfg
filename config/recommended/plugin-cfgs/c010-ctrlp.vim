" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'E'

let g:ctrlp_cache_dir = expand("$VIM_CACHES") . '/ctrlp/cache'

if has("win32")
    let g:ctrlp_mruf_case_sensitive = 0
else
    let g:ctrlp_mruf_case_sensitive = 1
endif

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](.git|.hg|.svn|.bzr|bin|cabal-dev|dist)$\|/tmp',
    \ 'file': '\v\.(exe|so|dll|o|swp|pyc|wav|mp3|ogg|pdf|hi)$\|\~$',
    \ }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }
