" ======================== general ===================

" コロンとセミコロンを入れ替え
noremap ; :
noremap : ;

" <Leader> をspaceキーに割り当てる
let mapleader = "\<Space>"

" normal modeでEnterで改行を挿入
nnoremap <CR> i<CR><ESC>

" normal modeでCtrl+oで改行を挿入
nnoremap <C-o> o<ESC>

" insert modeで文途中で改行を挿入
inoremap <C-o> <ESC>o

" normal modeでCtrl+tを遷移元に戻れるように
nnoremap <C-t> <C-o>


inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ======================== ctags ===================
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" Ctrl + ] で新規タブを開いてジャンプする
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" ======================== ウィンドウ関連のkeymap ========================
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
