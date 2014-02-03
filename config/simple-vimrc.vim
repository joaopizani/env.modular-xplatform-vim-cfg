" simple-vimrc.vim
"
" Some simple customization that should not depend on plugins.
" Mostly UI tweaks, mappings and segregation of backup files.
" Some mappings trigger plugin actions, but if the plugins are not installed
" you can just avoid using these (few) mappings.

let $VIM_AUXDIR = expand("$VIM_ROOT") . '/runtime/aux'

set nocompatible
filetype plugin indent on



" tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4  " Backspace goes back 4 spaces
set backspace=indent,eol,start
autocmd FileType make setlocal noexpandtab  " no fake tabs in makefiles

" navigation
set wildmenu
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common.
set scrolljump=3                " lines to scroll when cursor leaves screen
set scrolloff=1                 " minimum lines to keep above and below cursor
set foldmethod=syntax
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk



" GUI
if has("gui_running")
    set lines=45
    set columns=131
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    if has("win32")
        set guifont=Courier_New:h10:cANSI
    else
        set guifont=Ubuntu\ Mono\ 11
    endif
endif

set t_Co=256
if &term =~ '256color'  " Disable BCE so that colors work when Vim is inside tmux and GNU screen.
    set t_ut=
endif
colorscheme torte " comes prebundled, is a nice default when plugins are off

set shortmess+=filmnrxoOtT  " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,cursor,unix,slash  " better unix / windows compatibility
set virtualedit=onemore  " allow for cursor beyond last character
set history=500  " Store a ton of history (default is 20)
set cursorline  " highlight current line
set laststatus=2  " always display the status line

" for when syntax-specific indentation is off, this is a nice default
set autoindent

set colorcolumn=101  " column tolerance at 100. We can toggle between hard- and soft-wrapping.
set textwidth=0
set formatoptions=""
set wrap linebreak nolist
set showbreak=⋯  " unicode ellipsis to show that a line is wrapped
if exists('+breakindent')
    set breakindent
endif

let g:hard_wrap = 0
function! s:WrapToggle()
    if g:hard_wrap
        let g:hard_wrap = 0
        set textwidth=0
        set formatoptions=""
        echo "SOFT WRAPPING"
    else
        let g:hard_wrap = 1
        set textwidth=100
        set formatoptions=tanw
        echo "HARD WRAPPING"
    endif
endfunction
command! ToggleWrap call <SID>WrapToggle()



" command to toggle quickfix window (home-made solution, simple and short)
function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()



" mappings
" F-keys
nnoremap <silent> <F4> :NERDTreeToggle<CR>
inoremap <silent> <F4> <C-o>:NERDTreeToggle<CR>

nnoremap <silent> <F5> :TagbarToggle<CR>
inoremap <silent> <F5> <C-o>:TagbarToggle<CR>

nnoremap <silent> <F6> :ToggleQuickfix<CR>
inoremap <silent> <F6> <C-o>:ToggleQuickfix<CR>

nnoremap <silent> <F7> :cn<CR>
inoremap <silent> <F7> <C-o>:cn<CR>

nnoremap <silent> <F8> :wa<CR>
inoremap <silent> <F8> <C-o>:wa<CR>

" compiling might be remapped by language-specific configs
nmap <silent> <F9> :make!<CR>
imap <silent> <F9> <C-o>:make!<CR>


" Easier moving in windows and resizing windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

if match($TERM, "screen") != -1
    nnoremap [1;3A  <C-w>+
    nnoremap [1;3B  <C-w>-
    nnoremap [1;3D  <C-w><
    nnoremap [1;3C  <C-w>>
else
    nnoremap <A-Up>    <C-w>+
    nnoremap <A-Down>  <C-w>-
    nnoremap <A-Left>  <C-w><
    nnoremap <A-Right> <C-w>>
endif


" Remapping the leader key
nnoremap <space> <Nop>
let mapleader = " "
let maplocalleader = "\\"

" toggle search highlight
nnoremap <silent> <Leader>sh :set hlsearch!<CR>

" toggle paste mode (useful for keeping spacing and indent)
nnoremap <silent> <Leader>pp :set paste!<CR>

" toggle line numbers
nnoremap <silent> <Leader>nn :set number!<CR>

" toggle between hard and soft wrapping
nnoremap <Leader>hh :ToggleWrap<CR>

" remove trailing whitespace from file
nnoremap <silent> <Leader>rt :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:set hlsearch<CR>


" shortcut for activating omni completion both in Vim and GVim.
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>



" set makeprg so that when you activate :make, then make -j<N+1> is run, where N is
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
set backup                     " backups are nice...
if has('persistent_undo')
    set undofile               " so is persistent undo...
    set undolevels=100         " maximum number of changes that can be undone
    set undoreload=3000        " maximum number lines to save for undo on a buffer reload
endif
" Could use * rather than *.*, but I prefer to leave .files unsaved
au BufWinLeave *.* silent! mkview    " make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview  " make vim load view (state) (folds, cursor, etc)

function! InitializeDirectories()
    let parent = expand("$VIM_AUXDIR")
    let dir_list = {'backup': 'backupdir',   'views': 'viewdir',   'swap': 'directory'}
    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . dirname . "/"
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



" Remaining configuration
if has("vms")
    set nobackup   " do not keep a backup file, use versions instead
else
    set backup     " keep a backup file
endif
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


if has('mouse')
  set mouse=a    " the mouse works just fine, thus enable it.
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

    augroup END
endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

