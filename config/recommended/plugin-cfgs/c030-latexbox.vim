" LaTeX-related options

" uses asnchronous compilation, quiet and to PDF
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_options = '-quiet -pdf -f'

" Do not show warnings in the Quickfix window
let g:LatexBox_show_warnings = 0

let g:LatexBox_split_width = 26
let g:LatexBox_split_side = 'rightbelow'


au BufNewFile,WinEnter *.tex   nmap <silent> <F9>  :w<CR>:Latexmk<CR>
au BufNewFile,WinEnter *.tex   imap <silent> <F9>  <C-o>:w<CR><C-o>:Latexmk<CR>
