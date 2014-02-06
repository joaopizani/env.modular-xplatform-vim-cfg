function! CoquilleUserMapping()
    nnoremap <buffer> <silent> <C-g> :CoqNext<CR>
    inoremap <buffer> <silent> <C-g> <C-o>:CoqNext<CR>

    nnoremap <buffer> <silent> <C-y> :CoqUndo<CR>
    inoremap <buffer> <silent> <C-y> <C-o>:CoqUndo<CR>

    nnoremap <buffer> <silent> <C-e> :CoqToCursor<CR>
    inoremap <buffer> <silent> <C-e> <C-o>:CoqToCursor<CR>

    nnoremap <buffer> <F9> :Coq<Space>
    inoremap <buffer> <F9> <C-o>:Coq<Space>
endfunction

" Possibilities are those above + the standards: coquille#FNMapping and coquille#CoqideMapping
au FileType coq call CoquilleUserMapping()
