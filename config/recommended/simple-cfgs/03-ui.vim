if has("gui_running")
    set lines=45
    set columns=146
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=m  " remove menu bar
    if has("win32")
        set guifont=Courier_New:h10:cANSI
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
endif

set t_Co=256
if &term =~ '256color'  " Disable BCE, Vim is inside tmux or GNU screen.
    set t_ut=
endif

colorscheme torte " nice default when plugins are off

set shortmess+=filmnrxoOtT  " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,cursor,unix,slash  " better unix / windows compatibility
set virtualedit=onemore  " allow for cursor beyond last character
set history=500  " Store a ton of history (default is 20)
set cursorline  " highlight current line
set laststatus=2  " always display the status line

set autoindent  " for when syntax-specific indentation is off

command! -nargs=1 Silent
\ | execute ':silent '.<q-args>
\ | execute ':redraw!'
