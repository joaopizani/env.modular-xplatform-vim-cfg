" simple part - can be used with no vundle packages installed
source $VIMROOT/config/simple-vimrc.vim


" detects whether the neobundle plugin manager is present.
let s:neobundle_present = filereadable(expand("$VIMROOT") . "/runtime/bundle/neobundle.vim/README.md")

if(s:neobundle_present)
    let g:neobundle#types#git#default_protocol = 'https'

    if has('vim_starting')
        set rtp+=$VIMROOT/runtime/bundle/neobundle.vim/
    endif

    call neobundle#rc(expand('$VIMROOT/runtime/bundle/'))
    source $VIMROOT/config/plugin-dependent/pluginlist.vim
    filetype plugin indent on

    if !has('vim_starting')
        call neobundle#call_hook('on_source')
    endif


    " Include configurations organized in subject-segregated modules
    source $VIMROOT/config/plugin-dependent/ui.vim  " user-interface stuff
    source $VIMROOT/config/plugin-dependent/tags.vim  " tags and stuff
    source $VIMROOT/config/plugin-dependent/latex.vim  " configurations for LaTeX-Vim
endif

