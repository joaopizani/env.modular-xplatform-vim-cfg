let g:syntastic_html_checkers = ['w3']
let g:syntastic_tex_checkers = ['lacheck']

nnoremap <silent> <F12> :SyntasticCheck<CR>
inoremap <silent> <F12> <C-o>:SyntasticCheck<CR>
