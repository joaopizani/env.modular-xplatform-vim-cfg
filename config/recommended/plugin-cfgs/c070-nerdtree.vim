" NERDTree
let NERDTreeChDirMode = 1
let NERDChristmasTree = 1
let NERDTreeShowBookmarks = 1
let NERDTreeWinSize = 26
let NERDTreeBookmarksFile = expand("$VIM_RUNTIME") . '/NERDTreeBookmarks'

function! s:doNERDTreeFocusOrCloseIfInside()
    if bufname("%") =~ "NERD_tree"
        NERDTreeClose
    else
        NERDTreeFocus
    endif
endfunction
command! NERDTreeFocusOrCloseIfInside call <SID>doNERDTreeFocusOrCloseIfInside()

nnoremap <silent> <F4> :NERDTreeFocusOrCloseIfInside<CR>
inoremap <silent> <F4> <C-o>:NERDTreeFocusOrCloseIfInside<CR>
