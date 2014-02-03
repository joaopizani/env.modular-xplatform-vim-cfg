let $VIM_RUNTIME = expand("$VIM_ROOT") . '/runtime'
let $VIM_BUNDLES = expand("$VIM_RUNTIME") . '/bundle'
let $VIM_CONFIG = expand("$VIM_ROOT") . '/config'
let $VIM_CFG_REC = expand("$VIM_CONFIG") . '/recommended'
let $VIM_CFG_EXT = expand("$VIM_CONFIG") . '/extra'

let $VIM_CACHES = expand("$VIM_RUNTIME") . '/caches'


" simple part - can be used with no extra plugins installed
for f in glob(expand("$VIM_CFG_REC") . '/simple-cfgs/*.vim', 1, 1)  " list = 1
    exe 'source' f
endfor
for f in glob(expand("$VIM_CFG_EXT") . '/simple-cfgs/*.vim', 1, 1)  " list = 1
    exe 'source' f
endfor


" detects whether the neobundle plugin manager is present and loads plugins
let s:neobundle_present = filereadable(expand("$VIM_BUNDLES") . "/neobundle.vim/README.md")
if(s:neobundle_present)
    let g:neobundle#types#git#default_protocol = 'https'

    if has('vim_starting')
        set rtp+=$VIM_BUNDLES/neobundle.vim/
    endif
    call neobundle#rc(expand('$VIM_BUNDLES/'))

    for f in glob(expand("$VIM_CFG_REC") . '/plugin-lists/*.vim', 1, 1)  " list = 1
        exe 'source' f
    endfor
    for f in glob(expand("$VIM_CFG_EXT") . '/*/plugin-lists/*.vim', 1, 1)  " list = 1
        exe 'source' f
    endfor

    filetype plugin indent on

    if !has('vim_starting')
        call neobundle#call_hook('on_source')
    endif

    for f in glob(expand("$VIM_CFG_REC") . '/plugin-cfgs/*.vim', 1, 1)  " list = 1
        exe 'source' f
    endfor
    for f in glob(expand("$VIM_CFG_EXT") . '/*/plugin-cfgs/*.vim', 1, 1)  " list = 1
        exe 'source' f
    endfor
endif

