let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_html_checkers = ['w3']
let g:syntastic_tex_checkers = ['lacheck']

nnoremap <silent> <F12> :w<CR>:SyntasticCheck<CR>
inoremap <silent> <F12> <C-o>:w<CR><C-o>:SyntasticCheck<CR>

nnoremap <Leader>sm :SyntasticToggleMode<CR>
