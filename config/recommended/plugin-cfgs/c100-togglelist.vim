let g:toggle_list_no_mappings = 1

nnoremap <script><silent> <F5> :call ToggleQuickfixList()<CR>
inoremap <script><silent> <F5> <C-o>:call ToggleQuickfixList()<CR>

nnoremap <script><silent> <F6> :call ToggleLocationList()<CR>
inoremap <script><silent> <F6> <C-o>:call ToggleLocationList()<CR>

