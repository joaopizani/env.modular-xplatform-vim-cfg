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
    Bundle 'mbbill/undotree'
    Bundle 'plasticboy/vim-markdown'
    Bundle 'tpope/vim-fugitive'
    Bundle 'kien/ctrlp.vim'
    Bundle 'ZoomWin'

    " LaTeX
    Bundle "LaTeX-Box-Team/LaTeX-Box"

    " plugins for programming (language-independent)
    Bundle 'majutsushi/tagbar'
    Bundle 'xolox/vim-easytags'
    Bundle 'msanders/snipmate.vim'
    Bundle 'tpope/vim-ragtag'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'skwp/vim-easymotion'

    " plugins for Haskell programming
    Bundle 'Shougo/vimproc'
    Bundle 'eagletmt/ghcmod-vim'
    Bundle 'Twinside/vim-haskellFold'
    Bundle 'Twinside/vim-haskellConceal'
    Bundle 'feuerbach/vim-hs-module-name'

    filetype plugin indent on


    " Include configurations organized in subject-segregated modules
    source $VIMROOT/config/ui.vim  " user-interface stuff
    source $VIMROOT/config/tags.vim  " tags and stuff
    source $VIMROOT/config/latex.vim  " configurations for LaTeX-Vim
    source $VIMROOT/config/haskell.vim  " Haskell-specific configs
endif

