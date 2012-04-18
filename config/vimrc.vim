" simple part - can be used with no vundle packages installed
source $VIMROOT/config/simple-vimrc.vim


" vundle and plugins configuration
filetype off
    set rtp+=$VIMROOT/runtime/bundle/vundle/
    call vundle#rc('$VIMROOT/runtime/bundle')

    Bundle 'gmarik/vundle'

    " general-purpose plugins
    Bundle 'scrooloose/nerdtree'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'jnurmine/Zenburn'
    Bundle 'sjl/gundo.vim'
    Bundle 'ZoomWin'

    " plugins for programming
    Bundle 'majutsushi/tagbar'
    Bundle 'xolox/vim-easytags'
    Bundle 'xolox/vim-shell'
    Bundle 'OmniCppComplete'
    Bundle 'a.vim'
    Bundle 'msanders/snipmate.vim'
filetype plugin indent on



" Include configurations organized in subject-segregated modules
source $VIMROOT/config/ui.vim  " user-interface stuff
source $VIMROOT/config/tags.vim  " tags and stuff
source $VIMROOT/config/latex.vim  " Configurations for LaTeX-Vim



" Remaining configuration
if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


if has('mouse')
  set mouse=a  " the mouse works just fine, thus enable it.
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
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

    " switch on syntax highlighting
    syntax on
else
    set autoindent  " always set autoindenting on
endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

