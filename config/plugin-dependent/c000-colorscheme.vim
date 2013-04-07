" color scheme
if (has('win32') && !has('gui_running')) || !exists("g:neobundle#log_filename")
    colorscheme torte
else
    colorscheme zenburn
endif
