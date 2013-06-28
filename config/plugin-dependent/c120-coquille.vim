function CoquilleLeaderMapping()
    map <buffer> <silent> <Leader>cu :CoqUndo<CR>
    map <buffer> <silent> <Leader>cn :CoqNext<CR>
    map <buffer> <silent> <Leader>cc :CoqToCursor<CR>

    imap <buffer> <silent> <C-e> <C-o>:CoqUndo<CR>
    imap <buffer> <silent> <C-f> <C-o>:CoqNext<CR>
    imap <buffer> <silent> <C-g> <C-o>:CoqToCursor<CR>
endfunction

" Possibilities are those above + the standards: coquille#FNMapping and coquille#CoqideMapping
au FileType coq call CoquilleLeaderMapping()

