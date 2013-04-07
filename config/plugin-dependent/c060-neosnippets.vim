" neosnippets
set completeopt-=preview  " disbales the annoying and non-self closing preview
let g:extrasnips = expand("$VIM_ROOT") . '/snippets'
let g:neosnippet#snippets_directory = g:extrasnips . '/honza-snippets/snippets,' . g:extrasnips . '/custom'
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-y> <Plug>(neosnippet_expand_or_jump)
smap <C-y> <Plug>(neosnippet_expand_or_jump)

