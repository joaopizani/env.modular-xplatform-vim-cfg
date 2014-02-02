NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
\    'build': {
\        'windows': 'make -f make_mingw32.mak',
\        'cygwin' : 'make -f make_cygwin.mak',
\        'mac' : 'make -f make_mac.mak',
\        'unix': 'make -f make_unix.mak',
\    },
\}

" general-purpose plugins
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'mbbill/undotree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'szw/vim-maximizer'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-pandoc/vim-pandoc'

" plugins for programming (language-independent)
NeoBundle 'majutsushi/tagbar'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

" LaTeX
NeoBundle "LaTeX-Box-Team/LaTeX-Box"
