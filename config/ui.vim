" color scheme
if has('win32') && !has('gui_running')
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


" snipMate
let g:snips_author ='João Paulo Pizani Flor'
let g:snippets_dir = expand('$VIMROOT/runtime/bundle/snipmate.vim/snippets') . ',' . expand('$VIMROOT/custom-snippets')


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
  \ 'dir':  '\v[\/]\.(git|hg|svn|bzr)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }


" mappings
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
nnoremap <silent> <Leader>gu :UndotreeToggle<CR>
