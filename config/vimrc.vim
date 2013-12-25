let $VIM_CONFIG = expand("$VIM_ROOT") . '/config'
let $VIM_RUNTIME = expand("$VIM_ROOT") . '/runtime'

let $VIM_BUNDLES = expand("$VIM_RUNTIME") . '/bundle'
let $VIM_CACHES = expand("$VIM_RUNTIME") . '/caches'


" simple part - can be used with no extra plugins installed
source $VIM_CONFIG/simple-vimrc.vim


" detects whether the neobundle plugin manager is present and loads plugins
let s:neobundle_present = filereadable(expand("$VIM_BUNDLES") . "/neobundle.vim/README.md")
if(s:neobundle_present)
    let g:neobundle#types#git#default_protocol = 'https'

    if has('vim_starting')
        set rtp+=$VIM_BUNDLES/neobundle.vim/
    endif

    call neobundle#rc(expand('$VIM_BUNDLES/'))
    source $VIM_CONFIG/plugin-dependent/pluginlist.vim
    filetype plugin indent on

    if !has('vim_starting')
        call neobundle#call_hook('on_source')
    endif

    " Source plugin-dependent cfgs in modules, careful not to load the plugin list again
    for f in split(glob(expand("$VIM_CONFIG") . '/plugin-dependent/c*.vim'), '\n')
        exe 'source' f
    endfor
endif

