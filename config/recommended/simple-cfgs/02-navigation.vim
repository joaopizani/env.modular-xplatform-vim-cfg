set wildmenu
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common.
set scrolljump=3                " lines to scroll when cursor leaves screen
set scrolloff=1                 " minimum lines to keep above and below cursor
set foldmethod=syntax
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" Wrapped lines treatment
nnoremap j gj
nnoremap k gk
