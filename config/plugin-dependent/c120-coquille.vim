function! CoquilleUserMapping()
    map  <buffer> <silent> <C-h> :CoqNext<CR>
    imap <buffer> <silent> <C-h> <C-o>:CoqNext<CR>

    map  <buffer> <silent> <C-y> :CoqUndo<CR>
    imap <buffer> <silent> <C-y> <C-o>:CoqUndo<CR>

    map  <buffer> <silent> <C-e> :CoqToCursor<CR>
    imap <buffer> <silent> <C-e> <C-o>:CoqToCursor<CR>

    map  <buffer> <silent> <F9> :Coq<Space>
    imap <buffer> <silent> <F9> <C-o>:Coq<Space>
endfunction

" Possibilities are those above + the standards: coquille#FNMapping and coquille#CoqideMapping
au FileType coq call CoquilleUserMapping()
