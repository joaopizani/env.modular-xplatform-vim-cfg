let $VIM_TAGS = expand("$VIM_CACHES") . '/tags'


if has("win32")
    let g:easytags_cmd = resolve(fnamemodify(expand("$VIM_ROOT"), ":8") . '\win\ctags58\ctags.exe')
endif

set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_file = expand("$VIM_TAGS") . '/global-tags'

let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
let g:easytags_auto_highlight = 0

let g:easytags_updatetime_min = 2000
set updatetime=3000


