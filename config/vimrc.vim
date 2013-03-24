let $VIM_CONFIG = expand("$VIM_ROOT") . '/config'
let $VIM_RUNTIME = expand("$VIM_ROOT") . '/runtime'

" simple part - can be used with no vundle packages installed
source $VIM_CONFIG/simple-vimrc.vim


" detects whether the neobundle plugin manager is present.
let s:neobundle_present = filereadable(expand("$VIM_RUNTIME") . "/bundle/neobundle.vim/README.md")

if(s:neobundle_present)
    let g:neobundle#types#git#default_protocol = 'https'

    if has('vim_starting')
        set rtp+=$VIM_RUNTIME/bundle/neobundle.vim/
    endif

    call neobundle#rc(expand('$VIM_RUNTIME/bundle/'))
    source $VIM_CONFIG/plugin-dependent/pluginlist.vim
    filetype plugin indent on

    if !has('vim_starting')
        call neobundle#call_hook('on_source')
    endif


    " Source plugin-dependent configs organized in subject-segregated modules
    for f in split(glob(expand("$VIM_CONFIG") . '/plugin-dependent/*.vim'), '\n')
        exe 'source' f
    endfor
endif

