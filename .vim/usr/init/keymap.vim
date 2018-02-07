inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ctags
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" Ctrl + ] で新規タブを開いてジャンプする
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" normal modeでEnterで改行を挿入
nnoremap <CR> i<CR><ESC>

" normal modeでCtrl+oで改行を挿入
nnoremap <C-o> o<ESC>
