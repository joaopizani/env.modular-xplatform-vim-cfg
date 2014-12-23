let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '⚠'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_html_checkers = ['w3']
let g:syntastic_tex_checkers = ['lacheck']

let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": ["tex", "html"] }


nnoremap <silent> <F12> :w<CR>:SyntasticCheck<CR>
inoremap <silent> <F12> <C-o>:w<CR><C-o>:SyntasticCheck<CR>

nnoremap <silent> <Leader>sc :SyntasticCheck<CR>
nnoremap <silent> <Leader>sr :SyntasticReset<CR>
nnoremap <silent> <Leader>sm :SyntasticToggleMode<CR>

