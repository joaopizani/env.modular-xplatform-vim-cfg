function! s:auBindingsAgdaBuild()
    nmap <buffer> <silent> <F9>  :Reload<CR>:Metas<CR>
    imap <buffer> <silent> <F9>  <C-o>:Reload<CR><C-o>:Metas<CR>

    nmap <buffer> <silent> <F10> :call Context()<CR>
    imap <buffer> <silent> <F10> <C-o>:call Context()<CR>
endfunction
command! BindingsAgdaBuild call <SID>auBindingsAgdaBuild()


au BufNewFile,BufRead,WinEnter *.agda,*.lagda  :BindingsAgdaBuild

