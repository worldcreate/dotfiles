" ======================== general ===================

" <Leader> をspaceキーに割り当てる
let mapleader = "\<Space>"

" normal modeでEnterで改行を挿入
nnoremap <CR> i<CR><ESC>

" normal modeでCtrl+oで改行を挿入
nnoremap <C-o> o<ESC>

" insert modeで文途中で改行を挿入
inoremap <C-o> <ESC>o


inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ======================== ctags ===================
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" Ctrl + ] で新規タブを開いてジャンプする
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>


" ======================== unite ===================
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
