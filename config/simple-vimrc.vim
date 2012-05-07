" simple-vimrc.vim
"
" Some simple customization that should not depend on plugins.
" Mostly UI tweaks, mappings and segregation of backup files.
" Some mappings trigger plugin actions, but if the plugins are not installed
" you can just avoid using these (few) mappings.
set nocompatible
filetype plugin indent on


" tabs 
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4 " Backspace goes back 4 spaces
set backspace=indent,eol,start
autocmd FileType make setlocal noexpandtab " no fake tabs in makefiles


" navigation
set wildmenu
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common, then all.

set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=2                 " minimum lines to keep above and below cursor
set foldmethod=syntax
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk


" UI
if has("gui_running")
    set lines=47
    set columns=160
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    if has("win32")
        set guifont=Courier_New:h9:cANSI
    else
        set guifont=Monospace\ 9
    endif
endif

set t_Co=256
set textwidth=110

set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set history=500                 " Store a ton of history (default is 20)
set hidden                      " allow buffer switching without saving
set cursorline                  " highlight current line



" mappings
" F-keys
nnoremap <silent> <F5> :NERDTreeToggle<CR>
inoremap <silent> <F5> <ESC>:NERDTreeToggle<CR>i

let g:shell_mappings_enabled = 0
nnoremap <silent> <F6> :cwindow<CR>
inoremap <silent> <F6> <ESC>:cwindow<CR>i

nnoremap <silent> <F7> :cn<CR>
inoremap <silent> <F7> <ESC>:cn<CR>i

nnoremap <silent> <F8> :AS<CR>
inoremap <silent> <F8> <ESC>:AS<CR>i

nnoremap <silent> <F9> :wa<CR>
inoremap <silent> <F9> <ESC>:wa<CR>i

nnoremap <silent> <F10> :make!<CR>
inoremap <silent> <F10> <ESC>:make!<CR>i

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos
nnoremap ; :

" Remapping the leader key
let mapleader = ","

" Some nice general-purpose shortcuts using the leader
nnoremap <silent> <Leader>nh :nohlsearch<CR>

" Easier moving in windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

" Easier resizing windows
nnoremap <A-Up> <C-w>+
nnoremap <A-Down> <C-w>-
nnoremap <A-Left> <C-w><
nnoremap <A-Right> <C-w>>


" Ctrl-Space autocomplete
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else 
    if has("unix")
        inoremap <Nul> <C-x><C-o>
    endif
endif




" set makeprg so that when you activate :make, then make -j<N> is run, where N is
" the exact number of processor cores in your machine.
function! SetMakeprg()
    if !empty($NUMBER_OF_PROCESSORS)
        let n = $NUMBER_OF_PROCESSORS + 0
    elseif filereadable('/proc/cpuinfo')
        let n = system('grep -c ^processor /proc/cpuinfo') + 0
    else
        let n = 1
    endif
    let &makeprg = 'make' . (n > 1 ? (' -j'.(n + 1)) : '')
endfunction
call SetMakeprg()



" backups, persistent undo and view files
set backup                     " backups are nice ...
if has('persistent_undo')
    set undofile               "so is persistent undo ...
    set undolevels=200         "maximum number of changes that can be undone
    set undoreload=5000        "maximum number lines to save for undo on a buffer reload
endif
" Could use * rather than *.*, but I prefer to leave .files unsaved
au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

function! InitializeDirectories()
    let separator = "."
    let parent = expand("$VIMROOT")
    let prefix = "runtime"
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . '/' . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
