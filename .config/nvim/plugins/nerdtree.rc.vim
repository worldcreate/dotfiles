nnoremap <silent> <Leader>n :<C-u>:NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>r :NERDTreeFind<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
