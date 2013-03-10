" color scheme
if (has('win32') && !has('gui_running')) || !exists("g:neobundle#log_filename")
    colorscheme torte
else
    colorscheme zenburn
endif

" NERDTree
let NERDTreeChDirMode = 2
let NERDChristmasTree = 1
let NERDTreeShowBookmarks = 1
let NERDTreeWinSize = 26
let NERDTreeBookmarksFile = expand("$VIMROOT") . '/runtime/NERDTreeBookmarks'

" tagbar
let g:tagbar_width=30

" powerline statusbar
let laststatus=2
let g:Powerline_symbols='unicode'

" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_cache_dir = expand("$VIMROOT") . '/runtime/ctrlp/cache'
if has("win32")
    let g:ctrlp_mruf_case_sensitive = 0
else
    let g:ctrlp_mruf_case_sensitive = 1
endif
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](.git|.hg|.svn|.bzr|bin|cabal-dev|dist)$',
    \ 'file': '\v\.(exe|so|dll|o|swp|pyc|wav|mp3|ogg|pdf|hi)$',
    \ }

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_temporary_dir = expand("$VIMROOT") . '/runtime/neocomplcache'

" mappings
nnoremap <silent> <Leader>gu :UndotreeToggle<CR>
