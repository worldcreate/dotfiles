" ======================== keymap ===================
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>file_mru<CR>
