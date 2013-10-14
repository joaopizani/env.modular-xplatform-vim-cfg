function! CoquilleUserMapping()
    noremap <buffer> <silent> <Leader>cu :CoqUndo<CR>
    noremap <buffer> <silent> <Leader>cn :CoqNext<CR>
    noremap <buffer> <silent> <Leader>cc :CoqToCursor<CR>

    noremap  <buffer> <silent> <C-e> :CoqToCursor<CR>
    inoremap <buffer> <silent> <C-e> <C-o>:CoqToCursor<CR>
endfunction

" Possibilities are those above + the standards: coquille#FNMapping and coquille#CoqideMapping
au FileType coq call CoquilleUserMapping()

