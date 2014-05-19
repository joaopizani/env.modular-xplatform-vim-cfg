" NERDTree
let NERDTreeChDirMode = 2
let NERDChristmasTree = 1
let NERDTreeShowBookmarks = 1
let NERDTreeWinSize = 26
let NERDTreeBookmarksFile = expand("$VIM_RUNTIME") . '/NERDTreeBookmarks'

nnoremap <silent> <F4> :NERDTreeToggle<CR>
inoremap <silent> <F4> <C-o>:NERDTreeToggle<CR>
