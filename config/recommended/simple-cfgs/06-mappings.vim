nnoremap <silent> <F4> :NERDTreeToggle<CR>
inoremap <silent> <F4> <C-o>:NERDTreeToggle<CR>

nnoremap <silent> <F5> :TagbarToggle<CR>
inoremap <silent> <F5> <C-o>:TagbarToggle<CR>

nnoremap <silent> <F7> :cn<CR>
inoremap <silent> <F7> <C-o>:cn<CR>

nnoremap <silent> <F8> :wa<CR>
inoremap <silent> <F8> <C-o>:wa<CR>

" compiling might be remapped by language-specific configs
nmap <silent> <F9> :Silent make<CR>
imap <silent> <F9> <C-o>:Silent make<CR>

" Easier moving in windows and resizing windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

if match($TERM, "screen") != -1
    nnoremap [1;3A  <C-w>+
    nnoremap [1;3B  <C-w>-
    nnoremap [1;3D  <C-w><
    nnoremap [1;3C  <C-w>>
else
    nnoremap <A-Up>    <C-w>+
    nnoremap <A-Down>  <C-w>-
    nnoremap <A-Left>  <C-w><
    nnoremap <A-Right> <C-w>>
endif


" Remapping the leader key
nnoremap <space> <Nop>
let mapleader = " "
let maplocalleader = "\\"

" toggle search highlight
nnoremap <silent> <Leader>sh :set hlsearch!<CR>

" toggle paste mode (useful for keeping spacing and indent)
nnoremap <silent> <Leader>pp :set paste!<CR>

" toggle line numbers
nnoremap <silent> <Leader>nn :set number!<CR>

" toggle soft/hard wrapping
nnoremap <Leader>hh :ToggleWrap<CR>

" remove trailing whitespace from file
nnoremap <silent> <Leader>rt :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:set hlsearch<CR>

" shortcut for activating U completion both in Vim and GVim.
imap <C-Space> <C-x><C-u>
imap <Nul> <C-Space>

" inserting newline after the cursor without entering insert mode (Gvim, Vim)
nnoremap <C-CR> o<ESC>
nnoremap <Nul> o<ESC>

