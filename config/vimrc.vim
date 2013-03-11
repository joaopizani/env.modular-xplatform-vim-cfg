" simple part - can be used with no vundle packages installed
source $VIMROOT/config/simple-vimrc.vim


" vundle and plugins configuration, ONLY if vundle is present
let s:neobundle_present = filereadable(expand("$VIMROOT") . "/runtime/bundle/neobundle.vim/README.md")

if(s:neobundle_present)
    filetype off

    if has('vim_starting')
        set rtp+=$VIMROOT/runtime/bundle/neobundle.vim/
    endif	

    call neobundle#rc(expand('$VIMROOT/runtime/bundle/'))

    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/vimproc', {
    \     'build': {
    \        'windows':'make -f make_mingw32.mak',
    \        'cygwin':'make -f make_cygwin.mak',
    \        'mac':'make -f make_mac.mak',
    \        'unix':'make -f make_unix.mak',
    \     },
    \ }

    " general-purpose plugins
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'Lokaltog/vim-powerline'
    NeoBundle 'jnurmine/Zenburn'
    NeoBundle 'mbbill/undotree'
    NeoBundle 'plasticboy/vim-markdown'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'kien/ctrlp.vim'
    NeoBundle 'szw/vim-maximizer'
    NeoBundle 'godlygeek/tabular'

    " LaTeX
    NeoBundle "LaTeX-Box-Team/LaTeX-Box"

    " plugins for programming (language-independent)
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'xolox/vim-easytags'
    NeoBundle 'tpope/vim-ragtag'
    NeoBundle 'scrooloose/nerdcommenter'
    NeoBundle 'skwp/vim-easymotion'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neosnippet'

    filetype plugin indent on

    " Include configurations organized in subject-segregated modules
    source $VIMROOT/config/ui.vim  " user-interface stuff
    source $VIMROOT/config/tags.vim  " tags and stuff
    source $VIMROOT/config/latex.vim  " configurations for LaTeX-Vim
endif

