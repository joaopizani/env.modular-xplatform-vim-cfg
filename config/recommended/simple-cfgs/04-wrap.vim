set colorcolumn=101  " column tolerance at 100
set textwidth=0
set formatoptions=""
set wrap linebreak nolist
set showbreak=⋯  " unicode ellipsis to show that a line is wrapped
if exists('+breakindent')
    set breakindent
endif

let g:hard_wrap = 0
function! s:WrapToggle()
    if g:hard_wrap
        let g:hard_wrap = 0
        set textwidth=0
        set formatoptions=""
        echo "soft wrapping"
    else
        let g:hard_wrap = 1
        set textwidth=100
        set formatoptions=tanw
        echo "hard wrapping"
    endif
endfunction
command! ToggleWrap call <SID>WrapToggle()

