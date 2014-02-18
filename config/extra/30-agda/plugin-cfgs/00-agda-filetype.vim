au BufNewFile,BufRead,WinEnter *.agda,*.lagda  nmap <buffer> <silent> <F9>  :Reload<CR>
au BufNewFile,BufRead,WinEnter *.agda,*.lagda  imap <buffer> <silent> <F9>  <C-o>:Reload<CR>

