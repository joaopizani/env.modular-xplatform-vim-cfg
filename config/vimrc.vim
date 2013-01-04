" simple part - can be used with no vundle packages installed
source $VIMROOT/config/simple-vimrc.vim


" vundle and plugins configuration, ONLY if vundle is present
if(filereadable(expand("$VIMROOT") . "/runtime/bundle/vundle/README.md"))
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
    Bundle 'plasticboy/vim-markdown'

    " LaTeX
    Bundle "LaTeX-Box-Team/LaTeX-Box"

    " plugins for programming (language-independent)
    Bundle 'tpope/vim-fugitive'
    Bundle 'majutsushi/tagbar'
    Bundle 'xolox/vim-easytags'
    Bundle 'xolox/vim-shell'
    Bundle 'msanders/snipmate.vim'
    Bundle 'tpope/vim-ragtag'

    filetype plugin indent on


    " Include configurations organized in subject-segregated modules
    source $VIMROOT/config/ui.vim  " user-interface stuff
    source $VIMROOT/config/tags.vim  " tags and stuff
    source $VIMROOT/config/latex.vim  " Configurations for LaTeX-Vim
endif

