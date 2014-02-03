" backups, persistent undo and view files
set backup  " backups are nice
if has('persistent_undo')
    set undofile  " so is persistent undo
    set undolevels=100  " maximum number of changes that can be undone
    set undoreload=3000  " maximum number lines to save for undo on a buffer reload
endif

" Could use * rather than *.*, but I prefer to leave .files unsaved
au BufWinLeave *.* silent! mkview    " make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview  " make vim load view (state) (folds, cursor, etc)

function! InitializeDirectories()
    let parent = expand("$VIM_AUXDIR")
    let dir_list = {'backup': 'backupdir', 'views': 'viewdir', 'swap': 'directory'}
    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory, "p")
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

